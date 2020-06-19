Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E2DB92008D3
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yXRBeNno7h9zv3DxSfr+k7ETioSj90sro1DTUTyCP6k=;
	b=Veqpyvc4+whpJWIy81Svdv19GJ1yfdMSFq6DH7bg6UvVWI7hUmlIuAp33yBp2stUTabE8p
	8mRnq8fIuIZrgbV87XnZhIy5ypi+y4uyDX+yG/ce7EVYW1+7saiOYROZBTWra9MCtoGqWS
	4AncYMiUFigKy2HqaZPGhtINjnjuJxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-uIs8Ky-CMSyV31T-WWsYjQ-1; Fri, 19 Jun 2020 08:39:20 -0400
X-MC-Unique: uIs8Ky-CMSyV31T-WWsYjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAAED107ACF2;
	Fri, 19 Jun 2020 12:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 756A71002388;
	Fri, 19 Jun 2020 12:39:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58CA9833D0;
	Fri, 19 Jun 2020 12:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J70rqh014911 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:00:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7CD27101B541; Fri, 19 Jun 2020 07:00:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 783981018E6A
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:00:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 023488007A4
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:00:51 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-61-m2oJAUmfO5i58qZzo52nyQ-1; Fri, 19 Jun 2020 03:00:47 -0400
X-MC-Unique: m2oJAUmfO5i58qZzo52nyQ-1
IronPort-SDR: 6YT0oH5qhVx5TFw9pVBGy88fprPu0F+iCVfFLE5hZUlN5uuAPpG0NuJV+lQqmToHSbFT7oFVIo
	DY9/Cxjz/sLwDgLbRjp9BP91c6oxumWYpzj6SY+4sKQpjKr2wH5iCunmHyvyOspaiBLLDJmJmh
	2V5D6n23rEduCkJI6PmJzLUIPN9hZCYir7UIAeTppsnQGdO24/x0B9/RdV9IHXgpHq4Yd3+Ocl
	SwQzKv3xGoAd6MM4TDfPIwgWLr6KlBikJqywmrqysPCJoZtMqQMfRPD77/b9A2fZujenVm+jyG
	poE=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="140655409"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 14:59:35 +0800
IronPort-SDR: 5OrpAIZDxvZQBuMEWjdwkX1r41uNgmPutAEClmJXOP/Ne7MArJ8Pc0Ayk81yFQOK9+B+CqvYME
	asddc2mxFUqADwP4Apktod7ahu40zp+Ck=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jun 2020 23:48:12 -0700
IronPort-SDR: n+oGSiGE6dPo7ZVMpchPQYKRjNmayWVvVXe1xP8BXTvGz3RVnh8UM9B0o0vvj2h3CIk4Roq0J5
	0FyyCOP8vFWA==
WDCIronportException: Internal
Received: from unknown (HELO redsun60.ssa.fujisawa.hgst.com) ([10.149.66.36])
	by uls-op-cesaip01.wdc.com with ESMTP; 18 Jun 2020 23:59:33 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 19 Jun 2020 15:59:03 +0900
Message-Id: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: linux-block@vger.kernel.org, Naohiro Aota <Naohiro.Aota@wdc.com>,
	dm-devel@redhat.com, Damien Le Moal <Damien.LeMoal@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [dm-devel] [PATCH 0/2] Two fixes for device-mapper with
	REQ_OP_ZONE_APPEND
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Two small fixes for issuing REQ_OP_ZONE_APPEND writes to device-mapper. The
first one is an issue reported by Naohiro and fixes a write failure. For
number two I'm not certain if it's the correct fix, hence the RFC tag.

Johannes Thumshirn (2):
  dm: update original bio sector on Zone Append
  dm: don't try to split REQ_OP_ZONE_APPEND bios

 drivers/md/dm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

