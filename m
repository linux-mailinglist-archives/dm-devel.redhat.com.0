Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F2F5C9F6
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 09:31:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADA1830C31B7;
	Tue,  2 Jul 2019 07:31:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3D8910018F9;
	Tue,  2 Jul 2019 07:30:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECC2D1806B15;
	Tue,  2 Jul 2019 07:30:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61IKuLq032039 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 14:20:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5933E2D351; Mon,  1 Jul 2019 18:20:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A402E034;
	Mon,  1 Jul 2019 18:20:45 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 2E266804F2;
	Mon,  1 Jul 2019 18:20:26 +0000 (UTC)
Received: from
	jaskaran-Intel-Server-Board-S1200V3RPS-UEFI-Development-Kit.corp.microsoft.com
	(unknown [131.107.160.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id 28A9620425FF;
	Mon,  1 Jul 2019 11:20:18 -0700 (PDT)
From: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
To: gmazyland@gmail.com, ebiggers@google.com
Date: Mon,  1 Jul 2019 11:19:57 -0700
Message-Id: <20190701181958.6493-1-jaskarankhurana@linux.microsoft.com>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 01 Jul 2019 18:20:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 01 Jul 2019 18:20:36 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 02 Jul 2019 03:29:26 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	mdsakib@microsoft.com, linux-kernel@vger.kernel.org,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	mpatocka@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org, agk@redhat.com
Subject: [dm-devel] [RFC PATCH v6 0/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 07:31:47 +0000 (UTC)

Changes in v6:

Address comments from Milan Broz and Eric Biggers on v5.

-Keep the verification code under config DM_VERITY_VERIFY_ROOTHASH_SIG.

-Change the command line parameter to requires_signatures(bool) which will
force root hash to be signed and trusted if specified.

-Fix the signature not being present in verity_status. Merged the
https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git/commit/?h=dm-cryptsetup&id=a26c10806f5257e255b6a436713127e762935ad3
made by Milan Broz and tested it.


Jaskaran Khurana (1):
  Add dm verity root hash pkcs7 sig validation.

 Documentation/device-mapper/verity.txt |   7 ++
 drivers/md/Kconfig                     |  12 +++
 drivers/md/Makefile                    |   5 +
 drivers/md/dm-verity-target.c          |  43 +++++++-
 drivers/md/dm-verity-verify-sig.c      | 133 +++++++++++++++++++++++++
 drivers/md/dm-verity-verify-sig.h      |  60 +++++++++++
 drivers/md/dm-verity.h                 |   2 +
 7 files changed, 257 insertions(+), 5 deletions(-)
 create mode 100644 drivers/md/dm-verity-verify-sig.c
 create mode 100644 drivers/md/dm-verity-verify-sig.h

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
