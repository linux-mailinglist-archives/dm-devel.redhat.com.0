Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C61414CE0
	for <lists+dm-devel@lfdr.de>; Mon,  6 May 2019 16:46:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D7C87E43D;
	Mon,  6 May 2019 14:46:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D670D60A98;
	Mon,  6 May 2019 14:46:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0CF73FA46;
	Mon,  6 May 2019 14:46:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x46Ek7Ob029939 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 May 2019 10:46:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24D2360A98; Mon,  6 May 2019 14:46:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6F16085B
	for <dm-devel@redhat.com>; Mon,  6 May 2019 14:46:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB95430833AF
	for <dm-devel@redhat.com>; Mon,  6 May 2019 14:46:03 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B5A4F20C01;
	Mon,  6 May 2019 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557153963;
	bh=sGpXY24iwci7z2Am1+FUc6Df1OS59EPQzWtawjEGjzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8hZ4U8jFXk+78pB6GeOiWwhaeyQ8yZcg6ihZNKhRejqMMDx4XUz6hh6ECuNE2gck
	Cth76/mAxCwAfA2dteTzB6+MYo+xXBqJrkakKFJ9A3Mj4Q55uYRy8Nw14S9hv8lb3E
	jqfVjUtYfkFkQC6qUTj+3ZYdP5nxKnDRmsg154E0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  6 May 2019 16:32:53 +0200
Message-Id: <20190506143057.279889325@linuxfoundation.org>
In-Reply-To: <20190506143053.287515952@linuxfoundation.org>
References: <20190506143053.287515952@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 06 May 2019 14:46:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Mon, 06 May 2019 14:46:03 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -5.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_HI,
	SPF_PASS,
	T_DKIMWL_WL_HIGH) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
	SCSI ML <linux-scsi@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>, stable@vger.kernel.org,
	NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>,
	DM ML <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 4.14 45/75] scsi: core: add new RDAC
	LENOVO/DE_Series device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 06 May 2019 14:46:16 +0000 (UTC)

[ Upstream commit 1cb1d2c64e812928fe0a40b8f7e74523d0283dbe ]

Blacklist "Universal Xport" LUN. It's used for in-band storage array
management.  Also add model to the rdac dh family.

Cc: Martin Wilck <mwilck@suse.com>
Cc: Hannes Reinecke <hare@suse.de>
Cc: NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: James E.J. Bottomley <jejb@linux.vnet.ibm.com>
Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: SCSI ML <linux-scsi@vger.kernel.org>
Cc: DM ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/scsi_devinfo.c | 1 +
 drivers/scsi/scsi_dh.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/scsi/scsi_devinfo.c b/drivers/scsi/scsi_devinfo.c
index 6b594bc7d94a..022fcd2e4702 100644
--- a/drivers/scsi/scsi_devinfo.c
+++ b/drivers/scsi/scsi_devinfo.c
@@ -248,6 +248,7 @@ static struct {
 	{"NETAPP", "Universal Xport", "*", BLIST_NO_ULD_ATTACH},
 	{"LSI", "Universal Xport", "*", BLIST_NO_ULD_ATTACH},
 	{"ENGENIO", "Universal Xport", "*", BLIST_NO_ULD_ATTACH},
+	{"LENOVO", "Universal Xport", "*", BLIST_NO_ULD_ATTACH},
 	{"SMSC", "USB 2 HS-CF", NULL, BLIST_SPARSELUN | BLIST_INQUIRY_36},
 	{"SONY", "CD-ROM CDU-8001", NULL, BLIST_BORKEN},
 	{"SONY", "TSL", NULL, BLIST_FORCELUN},		/* DDS3 & DDS4 autoloaders */
diff --git a/drivers/scsi/scsi_dh.c b/drivers/scsi/scsi_dh.c
index 375cede0c534..c9bc6f058424 100644
--- a/drivers/scsi/scsi_dh.c
+++ b/drivers/scsi/scsi_dh.c
@@ -75,6 +75,7 @@ static const struct scsi_dh_blist scsi_dh_blist[] = {
 	{"NETAPP", "INF-01-00",		"rdac", },
 	{"LSI", "INF-01-00",		"rdac", },
 	{"ENGENIO", "INF-01-00",	"rdac", },
+	{"LENOVO", "DE_Series",		"rdac", },
 	{NULL, NULL,			NULL },
 };
 
-- 
2.20.1



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
