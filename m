Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0244CE98
	for <lists+dm-devel@lfdr.de>; Thu, 11 Nov 2021 02:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636592888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SSo1hH+bzUrnJqC1OTnbilfZCGz8LFWH8oYtr9V2VC4=;
	b=XQSv0/qrgyTCPbyact3cICuxHP3NhptksKZI4yd9uUxFysBAJqjS9N/pNDWgvjBNdPcZ2i
	ssc6YmBjW/xbOcJmE+D1JCrOPFFIz+jxx/0Xy3uVOG0XcdiRusIuVXgD87hRMsg52aaque
	w5VIy4XE5tfR58m/jbDD26KlySa1U7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-rLUcdHO0O3yxtJD-fdJI1Q-1; Wed, 10 Nov 2021 20:07:05 -0500
X-MC-Unique: rLUcdHO0O3yxtJD-fdJI1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD1671006AA0;
	Thu, 11 Nov 2021 01:06:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31E2A1973B;
	Thu, 11 Nov 2021 01:06:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51CF64E590;
	Thu, 11 Nov 2021 01:06:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AB16SHW013096 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 20:06:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 635F529403; Thu, 11 Nov 2021 01:06:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98BBD18A68;
	Thu, 11 Nov 2021 01:06:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AB16MKT020429; 
	Wed, 10 Nov 2021 19:06:22 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AB16L7B020428;
	Wed, 10 Nov 2021 19:06:21 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 10 Nov 2021 19:06:11 -0600
Message-Id: <1636592780-20391-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/9] improving config parsing warnings
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a series of patches to make multipath provide better warnings
when parsing multipath.conf. The first three patches fix small issues.
The last five patches make multipath print warning messages with
the file and line number, when it was previously either accepting
invalid values or silently changing them.

Changes from v1 (by v1 patch number), as suggested by Martin Wilck:

0005: use MAX_VEROSITY enum in the verbosity handler declaration.
0006: added a new patch, 0007, to warn that these options are now
      deprecated, and no longer print them when the have the default
      value.  They are still used for now.
0007: functions that accept "0" as a special input value will now
      check if the integer gotten by do_set_int() is 0, and
      covert that to the special case.

Benjamin Marzinski (9):
  libmultipath: add section name to invalid keyword output
  libmultipath: use typedef for keyword handler function
  libmultipath: print the correct file when parsing fails
  libmultipath: pass file and line number to keyword handlers
  libmultipath: make set_int take a range for valid values
  libmultipath: improve checks for set_str
  libmultipath: deprecate file and directory config options
  libmultipath: split set_int to enable reuse
  libmultipath: cleanup invalid config handling

 libmultipath/dict.c        | 523 +++++++++++++++++++++++++------------
 libmultipath/parser.c      |  31 ++-
 libmultipath/parser.h      |  15 +-
 multipath/multipath.conf.5 |   5 +
 4 files changed, 389 insertions(+), 185 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

