import { HStack, Image } from "@chakra-ui/react";
import logo from "../assets/2B_Games_logo.webp";
import ColorModeSwitch from "./ColorModeSwitch";

const NavBar = () => {
  return (
    <HStack justifyContent="space-between" padding="10px">
      <Image src={logo} boxSize="24" borderRadius="full" />
      <ColorModeSwitch />
    </HStack>
  );
};

export default NavBar;
