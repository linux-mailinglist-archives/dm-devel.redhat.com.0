Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B03A37B26C
	for <lists+dm-devel@lfdr.de>; Wed, 12 May 2021 01:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620775382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TVT1M3o1AJH0AfvI/rdo0eE61XzXtuxXLLiRGMvU9dI=;
	b=If8Xw6w3DijkLXLpmPxA8sib7iU9uS4gqWk2qka9kpdqJ1v/kORW/+LfGYRZBIBbZtV961
	PZHPMT1lC8odQcTJfk+1rgaX0UG8nH0wliOGOtTfMbLRv5GH+UTXT93MhEr7g3ehLykoLL
	2z/0UMSFfHhuLRI/4a1dYrT3GaRNC6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-neOBDc43Nia8Z_iWL1duCw-1; Tue, 11 May 2021 19:22:44 -0400
X-MC-Unique: neOBDc43Nia8Z_iWL1duCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BB5F1009610;
	Tue, 11 May 2021 23:22:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F2B6E512;
	Tue, 11 May 2021 23:22:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF97E180B464;
	Tue, 11 May 2021 23:22:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BNMAeh013327 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 19:22:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79D892B196; Tue, 11 May 2021 23:22:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBCBD60C04;
	Tue, 11 May 2021 23:22:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14BNM5nb024022; 
	Tue, 11 May 2021 18:22:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14BNM4wv024021;
	Tue, 11 May 2021 18:22:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 May 2021 18:21:59 -0500
Message-Id: <1620775324-23984-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/5] Memory issues found by coverity
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is collection of issues found by coverity. The first three patches
deal with ev_remove_path() removing the path, but returning failure,
causing a use-after-free error. The last two patches fix memory leaks.

Benjamin Marzinski (5):
  multipathd: don't fail to remove path once the map is removed
  multipathd: remove duplicate orphan_paths in flush_map
  multipathd: make ev_remove_path return success on path removal
  multipath: free vectors in configure
  kpartx: Don't leak memory when getblock returns NULL

 kpartx/kpartx.c            |  2 ++
 libmultipath/structs_vec.c |  3 +--
 multipath/main.c           |  7 ++++++-
 multipathd/main.c          | 20 ++++++++++++--------
 4 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

