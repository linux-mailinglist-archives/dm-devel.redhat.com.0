Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AE96719D5BA
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 13:21:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585912889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i1lCO4M3VGkhESAgfQ7JzE/7J8+hAlVGEsS2k0Fst3w=;
	b=CBSCdmVY6HN9Js6H/BrvZOUnlyMs8xe99+kklsxV+9CXUfXTZQwaUag+GORnPc3tMd5gbt
	RfklvYGMTYj9SIKj/EhvSQyrwzykH78XeGIPzpM7ju7815v+06QG9U4Pfm/P/6ySHTn8RL
	Xpgh9ZiNJKwYNQmdPpboDCxNYN0iiMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-lJjDQ8N1MG629dlXPb-iaQ-1; Fri, 03 Apr 2020 07:21:26 -0400
X-MC-Unique: lJjDQ8N1MG629dlXPb-iaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1EF18A6EC1;
	Fri,  3 Apr 2020 11:21:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0158099E1A;
	Fri,  3 Apr 2020 11:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E72B18089CE;
	Fri,  3 Apr 2020 11:21:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033BKEFj011373 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 07:20:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0893713BBA5; Fri,  3 Apr 2020 11:20:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04AAB13BB9B
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:20:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5715185A790
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:20:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-122-pF7hijUONMm_8f9cZ-X00A-1;
	Fri, 03 Apr 2020 07:20:07 -0400
X-MC-Unique: pF7hijUONMm_8f9cZ-X00A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 02428AC0C;
	Fri,  3 Apr 2020 11:20:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  3 Apr 2020 13:19:12 +0200
Message-Id: <20200403111914.30717-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033BKEFj011373
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>, vliaskovitis@suse.com
Subject: [dm-devel] [PATCH v2 0/2] multipath-tools: fixes for kpartx.rules
	and skip_kpartx
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, Ben,

The "skip_kpartx" option serves to prevent creation of partitions on
top of multipath devices where that's undesired, e.g. on VM hosts which are
supposed to provide the unpartitioned dm devices to guests. This is broken
with our current udev rules, because partition creation is only suppressed
on "primary" uevents, and not on "sporadic" ones.

This series fixes the issue. It replaces my previous patch "kpartx.rules: 
check for skip_kpartx if DM_ACTIVATION is unset", which turned out to be
insufficient.

Regards,
Martin


Martin Wilck (2):
  kpartx.rules: honor DM_UDEV_DISABLE_OTHER_RULES_FLAG
  kpartx.rules: check for skip_kpartx on synthetic uevents

 kpartx/kpartx.rules | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

