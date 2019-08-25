Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD49CA2F
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D373308338F;
	Mon, 26 Aug 2019 07:24:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34E181E0;
	Mon, 26 Aug 2019 07:24:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1700180BA98;
	Mon, 26 Aug 2019 07:24:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7P7P1Bc024997 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 25 Aug 2019 03:25:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6E7C5C28F; Sun, 25 Aug 2019 07:25:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 356695C1D4;
	Sun, 25 Aug 2019 07:24:57 +0000 (UTC)
Received: from sender-pp-o92.zoho.com (sender-pp-o92.zoho.com [135.84.80.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B29AE3086262;
	Sun, 25 Aug 2019 07:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1566717892; cv=none; d=zoho.com; s=zohoarc; 
	b=KnLkakjaSWOr8aqqTr5CVmVZ0xhvbC3+Hzys3ngPB39g/9DVfTGf6FxriPtWUw3V+ocE7xcdXiBchcnGSBTZXi6z4EQAEjqvwe/2zJumsOxKvqz3hJBxA/gxHRx+pXiUHUohFGihSmiuUJjZj5sPxl/8BxmkX/2wyir4TJPky08=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1566717892;
	h=Cc:Date:From:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=3NNrUIjh0f1bPUDLf0taHzlL+12vPDpBw1ysyGZ4Buc=; 
	b=ZEZHYI5hbbIeaYzM23CnXFW8LU4NOXPqluvNw9GVZ1AiUrg3s4F8ejG+g4AM3v36/Kl0N19Iy2OPueldoP7b0PCcbV4XheoJj6F1tAKdrrQ/o0V0BuO65/o0KTp7TphJH/WNt3b7+0OU1RWSIP1lPD6FxlK03k9U77BY/If0NkQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=yehs2007@zoho.com;
	dmarc=pass header.from=<yehs2007@zoho.com>
	header.from=<yehs2007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=KrwyEn5/BSLfJ+YtUzU+AkVV8Rsm/8Xp8XERkgO5vJGf/a5HBAWdeaCAY9BmKxhtT/9qrg15sIm9
	e2m/S179nUw/TsI8YrIM+TAv44NjKCkHZ5cwjr4x9vP7ZNdCRHsD  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1566717892; 
	s=zm2019; d=zoho.com; i=yehs2007@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id; l=746;
	bh=3NNrUIjh0f1bPUDLf0taHzlL+12vPDpBw1ysyGZ4Buc=;
	b=hpPs0XdBa72lIv5iYS8vdFYeOPZ0/scJP2vh5TppahVjYOxh5JUjoICPUXIywQlY
	/5wAxfmIUw/SaxIWud5zXnC+h5bT0QFvX0bpRsbSG5x7PHGVYs82/Wdj/TiZ+6hAnTJ
	wuEqTplWtLijVl8tj2s1O/v8qX6bTgTl2J1wAJfg=
Received: from YEHS1XR3054QMS.lenovo.com (123.120.58.107 [123.120.58.107]) by
	mx.zohomail.com with SMTPS id 1566717891295534.7694710157881;
	Sun, 25 Aug 2019 00:24:51 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Sun, 25 Aug 2019 15:24:30 +0800
Message-Id: <20190825072433.2628-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sun, 25 Aug 2019 07:24:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sun, 25 Aug 2019 07:24:55 +0000 (UTC) for IP:'135.84.80.237'
	DOMAIN:'sender-pp-o92.zoho.com' HELO:'sender-pp-o92.zoho.com'
	FROM:'yehs2007@zoho.com' RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 135.84.80.237 sender-pp-o92.zoho.com 135.84.80.237
	sender-pp-o92.zoho.com <yehs2007@zoho.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Aug 2019 03:24:39 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH 0/3] optimize writecache_writeback for performance
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 26 Aug 2019 07:24:51 +0000 (UTC)

From: Huaisheng Ye <yehs1@lenovo.com>

Patch 1 and 2 are used for cleaning the code, and they have got
Acked-by from Mikulas.

Patch 3 is used for performance optimization when writeback_all,
which could save more than half of time.
Of course, if the blocks in writecache are more uncontinuous and
disordered, the more performance improvement would be gained from
this patch.

Huaisheng Ye (3):
  dm writecache: remove unused member pointer in writeback_struct
  dm writecache: add unlikely for getting two block with same LBA
  dm writecache: optimize performance by sorting the blocks for
    writeback_all

 drivers/md/dm-writecache.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
