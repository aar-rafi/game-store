import { HStack, Image } from "@chakra-ui/react";
import logo from "../assets/2B_Games_logo.webp";

const NavBar = () => {
  return (
    <HStack>
      <Image src={logo} boxSize="24" />
    </HStack>
  );
};

export default NavBar;
