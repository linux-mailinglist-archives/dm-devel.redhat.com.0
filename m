Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BADE2B138
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 11:19:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F542308222E;
	Mon, 27 May 2019 09:19:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A99891837F;
	Mon, 27 May 2019 09:19:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94921206D7;
	Mon, 27 May 2019 09:19:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ON4Xch014747 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 May 2019 19:04:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A75F7DFC0; Fri, 24 May 2019 23:04:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F14C45D71B;
	Fri, 24 May 2019 23:04:28 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id A7404A705;
	Fri, 24 May 2019 23:04:27 +0000 (UTC)
Received: from
	jaskaran-Intel-Server-Board-S1200V3RPS-UEFI-Development-Kit.corp.microsoft.com
	(unknown [131.107.160.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0B2D720B7192;
	Fri, 24 May 2019 16:04:27 -0700 (PDT)
From: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 24 May 2019 16:04:10 -0700
Message-Id: <20190524230411.9238-1-jaskarankhurana@linux.microsoft.com>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Fri, 24 May 2019 23:04:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Fri, 24 May 2019 23:04:27 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 May 2019 05:18:07 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	agk@redhat.com, jmorris@namei.org
Subject: [dm-devel] [PATCH 0/1 v2] Add dm verity root hash pkcs7 sig
	validation.
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 27 May 2019 09:19:30 +0000 (UTC)

This patch set adds in-kernel pkcs7 signature checking for the roothash of
the dm-verity hash tree.
The verification is to support cases where the roothash is not secured by
Trusted Boot, UEFI Secureboot or similar technologies.
One of the use cases for this is for dm-verity volumes mounted after boot,
the root hash provided during the creation of the dm-verity volume has to
be secure and thus in-kernel validation implemented here will be used
before we trust the root hash and allow the block device to be created.

Why we are doing validation in the Kernel?

The reason is to still be secure in cases where the attacker is able to
compromise the user mode application in which case the user mode validation
could not have been trusted.
The root hash signature validation in the kernel along with existing
dm-verity implementation gives a higher level of confidence in the
executable code or the protected data. Before allowing the creation of
the device mapper block device the kernel code will check that the detached
pkcs7 signature passed to it validates the roothash and the signature is
trusted by builtin keys set at kernel creation. The kernel should be
secured using Verified boot, UEFI Secure Boot or similar technologies so we
can trust it.

What about attacker mounting non dm-verity volumes to run executable
code?

This verification can be used to have a security architecture where a LSM
can enforce this verification for all the volumes and by doing this it can
ensure that all executable code runs from signed and trusted dm-verity
volumes.

Further patches will be posted that build on this and enforce this
verification based on policy for all the volumes on the system.

How are these changes tested?

veritysetup part of cryptsetup library was modified to take a optional
root-hash-sig parameter.

Commandline used to test the changes:

veritysetup open  <data_device> <name> <hash_device> <root_hash>
 --root-hash-sig=<root_hash_pkcs7_detached_sig>

The changes for veritysetup are in a topic branch for now at:
https://github.com/jaskarankhurana/veritysetup/tree/veritysetup_add_sig

Changelog:
v2:
  - Code review feedback to pass the signature binary blob as a key that can be
    looked up in the kernel and be used to verify the roothash.
    [Suggested by Milan Broz]
  - Made the code related change suggested in review of v1.
    [Suggested by Balbir Singh]

v1:
  - Add kconfigs to control dm-verity root has signature verification and 
    use the signature if specified to verify the root hash.

Jaskaran Khurana (1):
  Adds in-kernel pkcs7 sig checking the roothash of the dm-verity hash
    tree

 drivers/md/Kconfig                |  23 +++++
 drivers/md/Makefile               |   2 +-
 drivers/md/dm-verity-target.c     |  34 +++++++-
 drivers/md/dm-verity-verify-sig.c | 137 ++++++++++++++++++++++++++++++
 drivers/md/dm-verity-verify-sig.h |  31 +++++++
 5 files changed, 222 insertions(+), 5 deletions(-)
 create mode 100644 drivers/md/dm-verity-verify-sig.c
 create mode 100644 drivers/md/dm-verity-verify-sig.h

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
