Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E7A531F48EB
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jun 2020 23:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591738566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y2BKC3w7l+z66wa31SnSF8q+2Bd25OQr0kHtQw++hK8=;
	b=IFWtEsP31a0hiQXuyG/jzuEuDdlPfYAWDE8UBg8WZxW5QBk/dBS3SWsH4UTQoK8QBJj7SZ
	3uSggUuELomjEiSZJIvgqicKpmu5fudxXmNYK3XXwvZBbCYlXiUxu6J8eTuLm942lOxl5b
	D0mWKd32d8URnE/jmzVOW9r8y1cmgVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-OH_G2nxyMEWPZbjwE7RoQQ-1; Tue, 09 Jun 2020 17:36:01 -0400
X-MC-Unique: OH_G2nxyMEWPZbjwE7RoQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47621800053;
	Tue,  9 Jun 2020 21:35:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69CDA19C71;
	Tue,  9 Jun 2020 21:35:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17AF4B3498;
	Tue,  9 Jun 2020 21:35:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059LZYI9029275 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 17:35:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 676297BFE9; Tue,  9 Jun 2020 21:35:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84ECC7BFE3;
	Tue,  9 Jun 2020 21:35:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 059LZTBx026846; 
	Tue, 9 Jun 2020 16:35:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 059LZTnD026845;
	Tue, 9 Jun 2020 16:35:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  9 Jun 2020 16:35:26 -0500
Message-Id: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/3] multipath: change default devnode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I recently got a request to add the Oracle ASM filer driver devices to
multipath's builtin devnode blacklist.  However, instead of having to do
always this for each device type individually, I decided to make
multipath blacklist all non scsi, nvme, and dasd devnodes by default.
This is what the multipath udev rules already do.

Changes from v1:
Everything. Martin suggested an alternative method for doing this, which
is to treat an exclamation mark at the start of the blacklist/exceptions
regexes as inverting the matching on the rest of the regex.

Benjamin Marzinski (3):
  libmultipath: remove _blacklist_exceptions functions
  libmultipath: fix parser issue with comments in strings
  libmultipath: invert regexes that start with exclamation point

 libmultipath/blacklist.c   | 103 +++++++++++++++-------------------
 libmultipath/blacklist.h   |   3 +
 libmultipath/parser.c      |   4 +-
 multipath/multipath.conf.5 |  17 ++++--
 tests/blacklist.c          | 110 +++++++++++++++++++++++++++++++++++++
 tests/parser.c             |  42 ++++++++++++++
 tests/test-lib.c           |   2 +-
 7 files changed, 215 insertions(+), 66 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

