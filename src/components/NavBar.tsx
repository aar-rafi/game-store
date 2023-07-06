import { HStack, Image } from "@chakra-ui/react";
import logo from "../assets/site-icon.webp";
import ColorModeSwitch from "./ColorModeSwitch";
import SearchInput from "./SearchInput";

interface Props {
  onSearch: (search: string) => void;
}

const NavBar = ({ onSearch }: Props) => {
  return (
    <HStack padding="10px">
      <Image
        src={logo}
        boxSize="24"
        borderRadius="full"
        onClick={() => window.location.reload()}
      />

      <SearchInput onSearch={onSearch} />
      <ColorModeSwitch />
    </HStack>
  );
};

export default NavBar;
