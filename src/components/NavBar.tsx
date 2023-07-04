import { HStack, Image } from "@chakra-ui/react";
import logo from "../assets/2B_Games_logo.webp";
import ColorModeSwitch from "./ColorModeSwitch";
import SearchInput from "./SearchInput";

const NavBar = () => {
  return (
    <HStack padding="10px">
      <Image src={logo} boxSize="24" borderRadius="full" />
      <SearchInput />
      <ColorModeSwitch />
    </HStack>
  );
};

export default NavBar;
