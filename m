Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6F922F8F7
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jul 2020 21:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595877901;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zVSp54gUyCP2hB9UTV0K/RrYFExA2mUyiWPmxzKXlpQ=;
	b=K2dnWOX4HXQEW65LY2Kk346SDVCA3K0uHz0lzdUc6a3eptIcbhVCfC+kwXnovPfAwKziyv
	ksr/YeRuAhuWJOo+t/a39BK7G3h/yW3epCPM1UPj79LQsadFibTmk6K5kP1Ccl2Iw2xbkP
	vL0Aqpn4I0M6ymNyqtB6jFM4ovmd704=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-XANhPLjkPXaOKuaP5HCABA-1; Mon, 27 Jul 2020 15:24:59 -0400
X-MC-Unique: XANhPLjkPXaOKuaP5HCABA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 518F9106B243;
	Mon, 27 Jul 2020 19:24:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFB760C87;
	Mon, 27 Jul 2020 19:24:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF6681809554;
	Mon, 27 Jul 2020 19:24:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RJOXbZ024667 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 15:24:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDAE8726AE; Mon, 27 Jul 2020 19:24:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 685F488F02;
	Mon, 27 Jul 2020 19:24:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06RJOS5B005631; 
	Mon, 27 Jul 2020 14:24:29 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06RJOShO005630;
	Mon, 27 Jul 2020 14:24:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 27 Jul 2020 14:24:22 -0500
Message-Id: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/6] multipath cleanups
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

Patches 0003 & 0004 fix an issue that I've seen with paths whose checker
takes too long when multipathd is starting up and creating devices.

The others are minor build fixes or small cleanups to my previous
patchset.

Benjamin Marzinski (6):
  Makefile.inc: trim extra information from systemd version
  kpartx: fix -Wsign-compare error
  libmultipath: remove code duplication in path counting
  libmultipath: count pending paths as active on loads
  libmultipath: deal with flushing no maps
  multipath: deal with delegation failures correctly

 Makefile.inc                    |  2 +-
 kpartx/kpartx.c                 |  2 +-
 libmpathpersist/mpath_persist.c |  4 +--
 libmultipath/devmapper.c        |  5 ++--
 libmultipath/structs.c          | 52 ++++++++++++++++-----------------
 libmultipath/structs.h          |  2 +-
 multipath/main.c                |  9 ++++--
 7 files changed, 39 insertions(+), 37 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

