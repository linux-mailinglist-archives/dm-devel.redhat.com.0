Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF0518EBFB
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906309;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/ea0O/SyljFzzqW6ioDGiRjoBhOIXiMkSz6O549jTfk=;
	b=daG4ph9jP4E7604GWcQD6FpdqjLrG9b4tnTTTWVLAC7IJFx9GenZTMpaC5sut9dihjXjjl
	ytMzUVe5DNHbaN1AkTWSr3uxc/x/PtcnsIflkg66qKHDuLIkv+GF+Hai2f7d54Hq16jFv2
	3znqBSPTcBydvB3x7LUwSFVlO+Qwg1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-XwFWvHkFMkadlND9HhKrjg-1; Sun, 22 Mar 2020 15:45:07 -0400
X-MC-Unique: XwFWvHkFMkadlND9HhKrjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00040107ACCD;
	Sun, 22 Mar 2020 19:45:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84EF960BF1;
	Sun, 22 Mar 2020 19:45:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32011863A8;
	Sun, 22 Mar 2020 19:44:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiQnG025788 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 342E77E31C; Sun, 22 Mar 2020 19:44:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C44E5C1DE;
	Sun, 22 Mar 2020 19:44:23 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WA-0005xh-Vs; Sun, 22 Mar 2020 20:44:19 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:18 +0100
Message-Id: <20200322194220.074515600@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:20 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 0/7] dm-integrity patches
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

Hi

Here I'm sending dm-integrity patches for the upcoming merge window.
They supersede dm-integrity patches that I sent before.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

