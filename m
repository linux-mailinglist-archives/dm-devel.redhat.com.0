Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABD31F03C6
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jofd9FpHJ+7Whi1rsST02IxO2K8V8DnjBVcsWEohtmU=;
	b=jMaDCT8AMyI6Gkd0zkocxtX8zsIImH9G/l/isgqqzRRxFo3O0SYKFok5A7Q3XQOaGh4evB
	W8HhOdEAqYTXgSghbnuCX5+lsU4Ccig2bY66OklqyuvnGlMsOnZ52Pkz5pdANhRGH61j6w
	R/WZwMoGsN9qa0AXyT03sLABr6qJgYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-4_l79KJgO92ksCMPZM1UAQ-1; Fri, 05 Jun 2020 20:20:23 -0400
X-MC-Unique: 4_l79KJgO92ksCMPZM1UAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86F84100CCC7;
	Sat,  6 Jun 2020 00:20:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD9D160C47;
	Sat,  6 Jun 2020 00:20:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF5D287421;
	Sat,  6 Jun 2020 00:20:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0550V5hA000686 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jun 2020 20:31:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76E0C5D9DA; Fri,  5 Jun 2020 00:31:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4D55D9D7;
	Fri,  5 Jun 2020 00:31:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0550V1KG025522; 
	Thu, 4 Jun 2020 19:31:01 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0550V000025521;
	Thu, 4 Jun 2020 19:31:00 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  4 Jun 2020 19:30:58 -0500
Message-Id: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC PATCH 0/2] multipath: change default devnode
	blacklist
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I recently got a request to add the Oracle ASM filer driver devices to
multipath's builtin devnode blacklist.  However, instead of having to do
always this for each device type individually, I decided to make
multipath blacklist all non scsi, nvme, and dasd devnodes by default.
This is what the multipath udev rules already do. If people don't like
this solution, the alternative is to add another line to the default
devnode blacklist like "^(asm/|oracleafd/|ofsctl)".

Benjamin Marzinski (2):
  libmultipath: change filter_devnode arguments
  libmultipath: change how default devnode blacklist works

 libmultipath/blacklist.c   | 21 +++++++---------
 libmultipath/blacklist.h   |  2 +-
 libmultipath/config.c      |  5 ++++
 libmultipath/config.h      |  1 +
 libmultipath/discovery.c   |  4 +--
 libmultipath/print.c       | 12 ++++++---
 libmultipath/uevent.c      |  3 +--
 multipath/main.c           |  3 +--
 multipath/multipath.conf.5 | 11 +++++---
 multipathd/cli_handlers.c  |  3 +--
 tests/blacklist.c          | 51 ++++++++++++++++++++++++++++++++------
 11 files changed, 80 insertions(+), 36 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

