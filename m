Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 80EB816A205
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 10:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582536134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a1zlrrU6U7ToGjEXSY9dGxdEI1OjzMrCeGRu+xojceA=;
	b=ekeIBgvIB/5mSgqedbmVlBrsEWoMF3+z6eOAvBLhtQzqIrTbeuGDxN/0IDatkBpX4kFkaW
	z1J98NPgOV7ppUJ1MIcJ5u9vWP2lbyT2lROLc2zKe52mMgVEKS+14vh52mUBKluwz++xLR
	mVRDYEOup/4eomHjeW+U5pJDQUn3BZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-XnAq0RkDO-GAzxNv-vM8Tw-1; Mon, 24 Feb 2020 04:21:22 -0500
X-MC-Unique: XnAq0RkDO-GAzxNv-vM8Tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 220E0107ACC4;
	Mon, 24 Feb 2020 09:21:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB7D5D9CD;
	Mon, 24 Feb 2020 09:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77B6918095FF;
	Mon, 24 Feb 2020 09:21:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O9Kp0i001959 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 04:20:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5142F60C63; Mon, 24 Feb 2020 09:20:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-115.brq.redhat.com
	[10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9501760BF7;
	Mon, 24 Feb 2020 09:20:48 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1j69uv-0001WB-W5; Mon, 24 Feb 2020 10:20:46 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 24 Feb 2020 10:20:45 +0100
Message-Id: <20200224092027.027153200@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 24 Feb 2020 10:20:27 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 0/7] dm-writecache patches
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

Here I'm sending my dm-writecache patches. The first three patches should
be backported to the stable kernels because they fix bugs. The next four
patches are enhancements that should be queued for the next merge window.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

