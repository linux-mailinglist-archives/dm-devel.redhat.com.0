Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01CC1275EAA
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 19:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600882252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vrVgOEQXRnc6Row+aWznp9OhmohnVVW/0ZGsQcGurH8=;
	b=BNHK4g+NDyvhDaqWeRP4q2Jua/9GTBr3DoaCip6iHYYynKp0sE6FmiNHlX7YZUhzdkSAXk
	nR/47wC6KgZB3H03SRajxfo9g2vMaDNBokT87n0twmhj3P44NowmvrH/9rbSGDXHeNS20Q
	GRqyGwUFKHMAA88Nl6E6+wFoC757T+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457--gzUODd1N-O0Fu2zqhVqHA-1; Wed, 23 Sep 2020 13:30:49 -0400
X-MC-Unique: -gzUODd1N-O0Fu2zqhVqHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C6B3801002;
	Wed, 23 Sep 2020 17:30:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C23D873684;
	Wed, 23 Sep 2020 17:30:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 661B1183D040;
	Wed, 23 Sep 2020 17:30:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NHUVa3013346 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 13:30:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 300371006516; Wed, 23 Sep 2020 17:30:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9C41007260
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 17:30:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFDEA8007DF
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 17:30:28 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-540-b4XX9sjIMRioTbM-A0ZBdw-1; Wed, 23 Sep 2020 13:30:26 -0400
X-MC-Unique: b4XX9sjIMRioTbM-A0ZBdw-1
Received: by mail-qk1-f195.google.com with SMTP id t138so523107qka.0;
	Wed, 23 Sep 2020 10:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition;
	bh=3pFkA3pz8LuI0sxqCTepsUeVtM/3MLBYmtrtAxBYd10=;
	b=myW31qA5y9M01Lr3zi1ir16BMKfEiEIYAzcfMab75uYf3/X+8keoBwpdY9bPFo+aX9
	lnuLxlwjdukwNnmFmwOBu4FQhT4hBTSoDWUQ39dGar1GrXyol9Xyx3RQT7xisaEYHfgV
	IEShIdN93OLoNRKWIA886mQCzUr1zdqoVp6AWbUUf9ahampc1/LkJHxlKp+9tQEvDgmK
	B5ifjqFjr8MtDET1Aekd92NHCCKwFi8PriKaEOK6Q9rcqLytLypDK/clYBpdGvAxY2/G
	Q9i8wDZcoSSlz3Yd8DZW21YyPN5LTHkf1ymTQESoTWjcvY7JHK5rIHJVvUqWxEbJhxKV
	AKEw==
X-Gm-Message-State: AOAM5307MgJV2hwwZNo0L51UKH01GoMhXzHCd6+K7IrAZLW/UBoANL1h
	zIUUEjGa5sP6WBrgU59yS+s=
X-Google-Smtp-Source: ABdhPJyN48W5oammQkJsRewNb7n+w8HJi128qZ74s56p7dWCVtcMGLLgHWOlZycDTXlK8ObNe+KUuQ==
X-Received: by 2002:a05:620a:15c7:: with SMTP id
	o7mr925910qkm.486.1600882226026; 
	Wed, 23 Sep 2020 10:30:26 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id s10sm396856qkg.61.2020.09.23.10.30.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Sep 2020 10:30:25 -0700 (PDT)
Date: Wed, 23 Sep 2020 13:30:24 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200923173024.GA97173@lobo>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.9 final
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit beaeb4f39bc31d5a5eb6d05465a86af4fe147732:

  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm (2020-09-21 08:53:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.9/dm-fixes-2

for you to fetch changes up to 4c07ae0ad493b7b2d3dd3e53870e594f136ce8a5:

  dm crypt: document encrypted keyring key option (2020-09-22 13:25:58 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- DM core fix for incorrect double bio splitting. Keep "fixing" this
  because past attempts didn't fully appreciate the liability relative
  to recursive bio splitting. This fix limits DM's bio splitting to a
  single method and does _not_ use blk_queue_split() for normal IO.

- DM crypt Documentation updates for features added during 5.9 merge.

----------------------------------------------------------------
Mike Snitzer (2):
      dm: fix bio splitting and its bio completion order for regular IO
      dm: fix comment in dm_process_bio()

Milan Broz (2):
      dm crypt: document new no_workqueue flags
      dm crypt: document encrypted keyring key option

 .../admin-guide/device-mapper/dm-crypt.rst         | 10 +++++++-
 drivers/md/dm.c                                    | 27 ++++------------------
 2 files changed, 14 insertions(+), 23 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

