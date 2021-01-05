Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1258C2EA42D
	for <lists+dm-devel@lfdr.de>; Tue,  5 Jan 2021 05:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609819240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GXSSFiaxrGLKaBhyqmzPkhMixdfVjHPFoZ2lGYsdjak=;
	b=aid+HsZOgHWTzZaZgNDH81ruVbMRa182z2+SHjtWGmZFLUMoGlT3Sho5ayxeKWIDSC033T
	CMpMEv882nvgHZJYA+HhGoK1ZN6TVU1qSKVZO7t9/e4cdLyrnc8YOVvtXSNLQaa95sSBY8
	EbjQ8+r+31n5hwVn76wVHYmc2WwmAeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-v5AIDZHnNNO80bvh9NOY2Q-1; Mon, 04 Jan 2021 23:00:37 -0500
X-MC-Unique: v5AIDZHnNNO80bvh9NOY2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0317801AA3;
	Tue,  5 Jan 2021 04:00:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6807457;
	Tue,  5 Jan 2021 04:00:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D8AA180954D;
	Tue,  5 Jan 2021 04:00:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10540108008467 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 23:00:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE8986F95B; Tue,  5 Jan 2021 04:00:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8F86F940;
	Tue,  5 Jan 2021 03:59:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1053xuTf018344; 
	Mon, 4 Jan 2021 21:59:56 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1053xt5p018343;
	Mon, 4 Jan 2021 21:59:55 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon,  4 Jan 2021 21:59:53 -0600
Message-Id: <1609819195-18306-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/2] multipath cleanup patches
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These patches are cleanups that Martin mentioned for my last patchset.
The first is some code that should have been in patch 4/6 (libmultipath:
ignore multipaths sections without wwid option). The second is V2 of
patch 6/6 (multipath.conf.5: Improve checker_timeout description), which
was updated based on Martin's comments.

Benjamin Marzinski (2):
  libmultipath: check for null wwid before strcmp
  multipath.conf.5: Improve checker_timeout description

 libmultipath/config.c      |  2 +-
 multipath/multipath.conf.5 | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

