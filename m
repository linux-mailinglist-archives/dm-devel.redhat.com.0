Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3771F9B1
	for <lists+dm-devel@lfdr.de>; Fri,  2 Jun 2023 07:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685684403;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qwm/cMq5EmJEtHDbXDiBiNyxLxShdat4HH1y4JibwyU=;
	b=ipXNcHPve6pUr1OTHzLG9XUtRXrPfFbvoGX16LPI7HBCAoBik6tw37eTaSYcBT5o4uPErK
	NBuu3ObhKZI2nv05IuMOsGwqjFVNSXgV6rIHitoDDXDH49HYLmvT976qlAJtJK8f4rvhDX
	07gEf9g0pGXMmMm6eWOlMtYxTvM0a8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-pnsp79IFMJiuqZOKwI683w-1; Fri, 02 Jun 2023 01:39:44 -0400
X-MC-Unique: pnsp79IFMJiuqZOKwI683w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3152811E85;
	Fri,  2 Jun 2023 05:39:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41D2B145B968;
	Fri,  2 Jun 2023 05:39:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8EDB01946A42;
	Fri,  2 Jun 2023 05:39:39 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A54A19451E5
 for <dm-devel@listman.corp.redhat.com>; Thu,  1 Jun 2023 07:24:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DD7242166B26; Thu,  1 Jun 2023 07:24:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D55BF2166B25
 for <dm-devel@redhat.com>; Thu,  1 Jun 2023 07:24:50 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC4EE800B35
 for <dm-devel@redhat.com>; Thu,  1 Jun 2023 07:24:50 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-Bdek-2o4OXShBf076x1nnA-1; Thu, 01 Jun 2023 03:24:49 -0400
X-MC-Unique: Bdek-2o4OXShBf076x1nnA-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-64d42024c99so249714b3a.1
 for <dm-devel@redhat.com>; Thu, 01 Jun 2023 00:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685604288; x=1688196288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y+y6DPvpxnpxkpq797HbPrufS4IN8CiXfOsCDPk430k=;
 b=Vy6PDgSYpVMbolAU+9RW/x0Lv5ubyrA48dZwZgpwLq+5o/Sg1Q7Q0Sh0nw2konOUNs
 4vLbNAka5y8Mc0tZXkAaEWWO0qqr1ktnScQoby3VZPIW2LjkWj4WVqT3oIhi5FFLZJZR
 XfmJarCN7G8hduA3qtTY8OMbA5kq8ro6sKtM9Gg5dveLuSpXDzGroptMH7+iWEdaFJX2
 8uinaZDqwqGiCNxUkdUicE9ucWtSm+OgZ831NL0sRDemzu0/NbVs1Rukbf7iCWUZ354L
 wdosE+hj0W0dZFrMQHWhy3BrrDtMMnMXxitjXOX3CFWzxFpTw2nmhu1Vok2LX2kMPvO1
 fZmQ==
X-Gm-Message-State: AC+VfDwGB4k81dLFGSAmrK9eIZvRQMeT5Jor1bcqAFqMsWJlnwgDbtxx
 cX1+/y5PHy90g2wjDZZV6ZmOKRLupfrEzBL+7Vv9DGYoutIdsykY2CBp1REku/sLW/54pZQIp6H
 yJ7EDi2LwGj83MfY=
X-Received: by 2002:a05:6a20:918a:b0:111:1bd6:270b with SMTP id
 v10-20020a056a20918a00b001111bd6270bmr7164908pzd.7.1685604288413; 
 Thu, 01 Jun 2023 00:24:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4FwTp/apIBasezyeJmFOSYq4Ca4y8dV0yy9NTwJ6MxPZcviNaRDT2lbI/v4rJt4YzOfO8RGw==
X-Received: by 2002:a05:6a20:918a:b0:111:1bd6:270b with SMTP id
 v10-20020a056a20918a00b001111bd6270bmr7164894pzd.7.1685604287964; 
 Thu, 01 Jun 2023 00:24:47 -0700 (PDT)
Received: from localhost ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001aad4be4503sm2700512pld.2.2023.06.01.00.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 00:24:47 -0700 (PDT)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Date: Thu,  1 Jun 2023 15:24:39 +0800
Message-Id: <20230601072444.2033855-1-coxu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Fri, 02 Jun 2023 05:39:36 +0000
Subject: [dm-devel] [PATCH 0/5] Support kdump with LUKS encryption by
 reusing LUKS volume key
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Baoquan He <bhe@redhat.com>, x86@kernel.org, dm-devel@redhat.com,
 Pingfan Liu <kernelfans@gmail.com>, linux-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Kairui Song <ryncsn@gmail.com>,
 Jan Pazdziora <jpazdziora@redhat.com>, Thomas Staudt <tstaudt@de.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Dave Young <dyoung@redhat.com>,
 Milan Broz <gmazyland@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v1
 - "Put the luks key handling related to crash_dump out into a separate
   file kernel/crash_dump_luks.c" [Baoquan]
 - Put the generic luks handling code before the x86 specific code to
   make it easier for other arches to follow suit [Baoquan]
 - Use phys_to_virt instead of "pfn -> page -> vaddr" [Dave Hansen]
 - Drop the RFC prefix [Dave Young]
 - Rebase the code onto latest Linus tree (6.4.0-rc4)

RFC v2
 - libcryptsetup interacts with the kernel via sysfs instead of "hacking"
   dm-crypt 
   - to save a kdump copy of the LUKS volume key in 1st kernel
   - to add a logon key using the copy for libcryptsetup in kdump kernel [Milan]
   - to avoid the incorrect usage of LUKS master key in dm-crypt [Milan]
 - save the kdump copy of LUKS volume key randomly [Jan]
 - mark the kdump copy inaccessible [Pingfan]
 - Miscellaneous
   - explain when operations related to the LUKS volume key happen [Jan]
   - s/master key/volume key/g
   - use crash_ instead of kexec_ as function prefix
   - fix commit subject prefixes e.g. "x86, kdump" to x86/crash

LUKS is the standard for Linux disk encryption. Many users choose LUKS
and in some use cases like Confidential VM it's mandated. With kdump
enabled, when the 1st kernel crashes, the system could boot into the
kdump/crash kernel and dump the memory image i.e. /proc/vmcore to a
specified target. Currently, when dumping vmcore to a LUKS
encrypted device, there are two problems,

 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes; For cloud confidential VMs, the kdump kernel can't unseal
   the key with TPM.

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump. Take Fedora example, by default, only 256M is reserved for
   systems having memory between 4G-64G. With LUKS enabled, ~1300M needs
   to be reserved for kdump. Note if the memory reserved for kdump can't
   be used by 1st kernel i.e. an user sees ~1300M memory missing in the
   1st kernel. 
 
Besides users (at least for Fedora) usually expect kdump to work out of
the box i.e. no manual password input is needed. And it doesn't make
sense to derivate the key again in kdump kernel which seems to be
redundant work.

Based on Milan's feedback [1] on Kairui's ideas to support kdump with
LUKS encryption, this patch set addresses the above issues by reusing
the LUKS volume key in kdump kernel and here is the life cycle of this
kdump copy of LUKS volume key,

 1. After the 1st kernel loads the initramfs during boot, systemd
    asks for a passphrase from the user and uses it to de-crypt the LUKS
    volume key

 2. After the 1st kernel saving the volume key as a logon key,
    libcrytpsetup notifies the kernel to read this logon key and store a
    temporary copy by writing the key description to
    /sys/kernel/crash_luks_volume_key

 3. After switching to the real root fs, kdump.serivce is started and it 
    loads the kdump kernel using the kexec_file_load syscall

 4. The kexec_file_load syscall saves the temporary copy of the volume
    key to kdump reserved memory and wipe the copy.

 5. When the 1st kernel crashes and kdump kernel is booted,
    libcryptsetup asks the kdump kernel to add a logon key using
    the volume key stored in kdump reserved memory by writing the key
    description to /sys/kernel/crash_luks_volume_key

 6. The system gets rebooted to the 1st kernel after dumping vmcore to
    the LUKS encrypted device is finished

Note the kdump copy of LUKS volume key never leaves the kernel space and
is saved in the memory area exclusively reserved for kdump where even
the 1st kernel has no direct access. 

Milan's major concern [2] on previous version is "storing the encryption
key to yet another place are creating another attack vector". To further
secure this copy, two additional protections are added,
 - save the copy randomly in kdump reserved memory as suggested by Jan
 - clear the _PAGE_PRESENT flag of the page that stores the copy as
   suggested by Pingfan

If there is no further security concern with this approach or any other
concern, I will drop the following assumptions,
  - only x86 is supported
  - there is only one LUKS device for the system

to extend the support to other architectures including POWER, ARM and
s390x and address the case of multiple LUKS devices. Any feedback will be 
appreciated, thanks!

For a proof of concept, I've patched cryptsetup [3] in a quick-and-dirty
way to support a new option "--kdump-kernel-master-key"
and hacked systemd [4]. It works for Fedora 37.

[1] https://yhbt.net/lore/all/e5abd089-3398-fdb4-7991-0019be434b79@gmail.com/
[2] https://lwn.net/ml/linux-kernel/c857dcf8-024e-ab8a-fd26-295ce2e0ae41@gmail.com/
[3] https://gitlab.com/coxu/cryptsetup/-/commit/750a46d933fac82e0c994b5c41de40a0b8cac647
[4] https://github.com/coiby/systemd/tree/reuse_kdump_master_key

Coiby Xu (5):
  kexec_file: allow to place kexec_buf randomly
  crash_dump: save the LUKS volume key temporarily
  crash_dump: retrieve LUKS volume key in kdump kernel
  x86/crash: pass the LUKS volume key to kdump kernel
  x86/crash: make the page that stores the LUKS volume key inaccessible

 arch/x86/include/asm/crash.h       |   1 +
 arch/x86/kernel/crash.c            |  47 ++++++-
 arch/x86/kernel/kexec-bzimage64.c  |   7 +
 arch/x86/kernel/machine_kexec_64.c |  14 ++
 include/linux/crash_core.h         |   2 +
 include/linux/crash_dump.h         |   2 +
 include/linux/kexec.h              |   6 +
 kernel/Makefile                    |   2 +-
 kernel/crash_dump_luks.c           | 202 +++++++++++++++++++++++++++++
 kernel/kexec_file.c                |  15 +++
 kernel/ksysfs.c                    |  19 +++
 11 files changed, 315 insertions(+), 2 deletions(-)
 create mode 100644 kernel/crash_dump_luks.c

-- 
2.40.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

