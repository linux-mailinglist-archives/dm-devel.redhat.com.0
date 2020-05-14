Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 751801D273E
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 08:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589436607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2ytNujYWhRtWwnamJdZvwKhoi9Fg/e0XZ7VhyKkdrf8=;
	b=eI+yHK0EMABfsSvDBgKizu7zgpi1EZXY3zbyvSlX08TXKpJrA5dJ7+IBDqF8BB07SFwBNm
	Rz8Xjvn8g9vJWHFL29rgQ9+JKQCXq8fZ1pjyO0ozQYa829FwoSnVOHo0gVmm/SukG0bl86
	FebYJuYbwtC+8s5WE39W2cheA0AagCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-_znhMNI0NMCeqPx7QTotSA-1; Thu, 14 May 2020 02:10:04 -0400
X-MC-Unique: _znhMNI0NMCeqPx7QTotSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77679EC1B4;
	Thu, 14 May 2020 06:09:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7950100EBA9;
	Thu, 14 May 2020 06:09:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC26A4E588;
	Thu, 14 May 2020 06:09:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E69ltn028255 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 02:09:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F24A106B450; Thu, 14 May 2020 06:09:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E103106B448
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:09:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64E3F8001E4
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:09:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-175-XL5LeEWMPsClENVQy-GzPA-1;
	Thu, 14 May 2020 02:09:35 -0400
X-MC-Unique: XL5LeEWMPsClENVQy-GzPA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 03163AD63;
	Thu, 14 May 2020 06:09:36 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Thu, 14 May 2020 08:09:27 +0200
Message-Id: <20200514060929.85469-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCHv2 0/2] device-mapper: use dynamic debug
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

here's an updated version of my earlier patch to switch to dynamic
debug instead of using a compile-time option.
I've modified the initial patch as suggested by Mike, and also fixed
up stray newlines which had crept in with some debugging messages
in dm-zoned.

Hannes Reinecke (2):
  device-mapper: use dynamic debug instead of compile-time config option
  dm-zoned: remove spurious newlines from debugging messages

 drivers/md/dm-zoned-reclaim.c | 4 ++--
 drivers/md/dm-zoned-target.c  | 4 ++--
 include/linux/device-mapper.h | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

