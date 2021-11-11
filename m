Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 274BF44DBD8
	for <lists+dm-devel@lfdr.de>; Thu, 11 Nov 2021 19:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636656902;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PriznlsWeUX5MNTWU3MmP72s5vu/3yDA7wmQmw1M7uc=;
	b=Acj7qKN6Y2yA0nGPuajoEfQdDqkUcNmFh+pCTLR5vdNjj4lH/As+tquc5X5IcQICsdGK7F
	qvH+KtpH1pk2Bqr88jinN0oXA2JuYRBQZHcsUPS0uhb5yNnYbOqi+9nVZhGaWq+4vPvknr
	pIwlDQ0EgCxGtmi+jc9r/GaijLoFnZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-WxUj7XXVNgi64d1Vtysl2g-1; Thu, 11 Nov 2021 13:54:41 -0500
X-MC-Unique: WxUj7XXVNgi64d1Vtysl2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B65B104ECE7;
	Thu, 11 Nov 2021 18:54:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B3615E278;
	Thu, 11 Nov 2021 18:54:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 297EE4EA31;
	Thu, 11 Nov 2021 18:54:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABIs9Pn027777 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 13:54:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1DA0A104B4CA; Thu, 11 Nov 2021 18:54:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 017B11002D71;
	Thu, 11 Nov 2021 18:53:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1ABIrrlU026100; 
	Thu, 11 Nov 2021 12:53:54 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1ABIrrIK026099;
	Thu, 11 Nov 2021 12:53:53 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 11 Nov 2021 12:53:43 -0600
Message-Id: <1636656832-26062-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 0/9] improving config parsing warnings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a series of patches to make multipath provide better warnings
when parsing multipath.conf. The first three patches fix small issues.
The last six patches make multipath print warning messages with
the file and line number, when it was previously either accepting
invalid values or silently changing them.

Changes from v2->v3, as suggested by Martin Wilck:
0007: still print the value of the deprecated options.
0008: revert to v1 patch

Changes from v1->v2 (by v1 patch number), as suggested by Martin Wilck:

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

 libmultipath/dict.c        | 492 +++++++++++++++++++++++++------------
 libmultipath/parser.c      |  31 ++-
 libmultipath/parser.h      |  15 +-
 multipath/multipath.conf.5 |   5 +
 4 files changed, 365 insertions(+), 178 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

