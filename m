Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B066CA5C1
	for <lists+dm-devel@lfdr.de>; Mon, 27 Mar 2023 15:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679923575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NXZpejfk9m2x166xoljOAmUwb5fJHbwRVXKNf9PXtG8=;
	b=S+W7qXS91tRVuvDIq/3WrxZIyydxSDmJHmyQ5jTt0muW7QapHoeihmqf+mFoDA4OX4jdIV
	i2FFoO1NXSv0Yc9/wOG7zPcd0WGEziHWUWK/86Fy6LLkNeD8z6OijrZ4dMXRe88YKFPPba
	zSQZbwHgpZqLWehDW7AS6Cmm4D6aGtg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-f9qfeZLJOMGorvxSi4UKWw-1; Mon, 27 Mar 2023 09:25:30 -0400
X-MC-Unique: f9qfeZLJOMGorvxSi4UKWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B02B3100DEAF;
	Mon, 27 Mar 2023 13:25:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4E202166B26;
	Mon, 27 Mar 2023 13:25:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94FA619465B9;
	Mon, 27 Mar 2023 13:25:22 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7967A194658F
 for <dm-devel@listman.corp.redhat.com>; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 55F9EC15BBA; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E678C15BB8
 for <dm-devel@redhat.com>; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3253B801779
 for <dm-devel@redhat.com>; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-Gp_dhOClMuuzeJvv5ZyCpw-1; Mon,
 27 Mar 2023 09:25:14 -0400
X-MC-Unique: Gp_dhOClMuuzeJvv5ZyCpw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F5881F8BB;
 Mon, 27 Mar 2023 13:25:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A42713329;
 Mon, 27 Mar 2023 13:25:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 20FmDDmZIWTobgAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 27 Mar 2023 13:25:13 +0000
From: mwilck@suse.com
To: Douglas Gilbert <dgilbert@interlog.com>,
	Hannes Reinecke <hare@suse.de>
Date: Mon, 27 Mar 2023 15:24:56 +0200
Message-Id: <20230327132459.29531-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [RFC PATCH 0/3] sg3_utils: udev rules: restrict use of
 ambiguous device IDs
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
Cc: James Bottomley <jejb@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Franck Bui <fbui@suse.de>,
 dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Most modern SCSI devices provide VPD page 83 with at least one highly
reliable device identifier, like NAA Registered Extended or EUI-64, or
the ata-id identifier. Other device identifier types have shown to be less
reliable and possibly ambiguous. Ambiguity in particular is a problem with
multipath-tools, which may group unrelated devices together in a multipath
map, causing possible data corruption.

The device identifiers are used in two independent ways by the udev rules:
a) to set ID_SERIAL for subsystems like multipath, and b) to create
/dev/disk/by-id/scsi-... symlinks. Our udev rules have traditionally created
symlinks for every device identifier obtained from either VPD 83 or 80. This
may cause issues, especially on large installments with storage devices that
exhibit the same identifier for many logical units. At the same time, these
symlinks are rarely used.

Avoid using unreliable identifiers for setting ID_SERIAL, and don't create
symlinks for these identifiers. Add a configuration method that allows
users to easily re-enable these methods and symlinks if they need to
(this might be the case on systems with legacy devices that are referenced
in /etc/crypttab, lvm.conf, or the like). This is done by introducing
environment variables .SCSI_ID_SERIAL_SRC and .SCSI_ID_SYMLINK_SRC, to
control use of device identifiers for determining ID_SERIAL and for creating
symlinks, respectively. Both variables can contain the letters "T", "L", "V",
and "S" to enable T10-vendor ID, NAA local ID, vendor-specific ID, and VPD 80
based ID, respectively.

Distributions can change the defaults for these environment variables
to provide backward compatibility for their users, while offering users
an easy way to change the settings.

I'm sending this as RFC, because I expect that not everyone will agree
which identifiers should be enabled by default.


Martin Wilck (3):
  55-scsi-sg3_id.rules: don't set unreliable device ID by default
  58-scsi-sg3_symlink.rules: don't create extra by-id symlinks by
    default
  udev: add 00-scsi-sg3_config.rules for user configuration

 Makefile.am                       |  1 +
 scripts/00-scsi-sg3_config.rules  | 23 ++++++++++++++
 scripts/55-scsi-sg3_id.rules      | 53 ++++++++++++++++++++++++++++---
 scripts/58-scsi-sg3_symlink.rules | 46 +++++++++++++++++++++------
 4 files changed, 109 insertions(+), 14 deletions(-)
 create mode 100644 scripts/00-scsi-sg3_config.rules

-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

