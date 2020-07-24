Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 963BC22CC95
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jul 2020 19:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595612902;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+NnaQ812VqnhdCqzE29PJKNSuxEOs3Xxa78mac/l9i4=;
	b=TaX5+9n5EhLWr7aE9rOBAIWbdM9Cm64Ch2ccCDS9JZoFWj/hExfzezkhdlVsKP8m85O+y7
	IGWUlYAJPN4H0xMFdxEJbIJh7ITIREY8/dhW6oiXc2UxDbH1m/2SvMQXlKYjQSu2aupgVf
	SCCR8dEkjs0L5li5Fcb3gh11yDDdaQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-0gbrwCvdMjiSs9n1ErcNuw-1; Fri, 24 Jul 2020 13:48:19 -0400
X-MC-Unique: 0gbrwCvdMjiSs9n1ErcNuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61B6B19057A5;
	Fri, 24 Jul 2020 17:48:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BAE5712C2;
	Fri, 24 Jul 2020 17:48:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FF13A358D;
	Fri, 24 Jul 2020 17:48:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OHlmqI012461 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 13:47:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 489932A345E; Fri, 24 Jul 2020 17:47:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C242A345C
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 17:47:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A6951012443
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 17:47:45 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-bx4Zw0sMOri3ZIJP9LM1fQ-1; Fri, 24 Jul 2020 13:47:40 -0400
X-MC-Unique: bx4Zw0sMOri3ZIJP9LM1fQ-1
Received: by mail-qk1-f196.google.com with SMTP id j187so9349155qke.11;
	Fri, 24 Jul 2020 10:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition;
	bh=vvtBe8wfI2Nyjo7UVPTJwjxI8vmvbV6uhPi1eXluD4Q=;
	b=jjnZ4EXmlsbj7ryVivWwr9dzI6gNo6aLdn2gMe6XbzJLdMycWdtLltncZ4G23I8Wp4
	3MFxAfRHvwGUQRyK5grk0PMxCC5qUO0LBXeokEXn8ssFN1pt2pGsjWS4OewtO2qzv8gN
	9KRwrOfnkw0FdbAsoWbeEdhRkQ9xkHlOe1zJrdQRoAfcG9hNyHwcjclKYnOHh4WAtrav
	f4wq9ZCwxtcsTk+Xl51kzLG+xVYTXJ3cvx0I/ei2ehqJ0WkL20iS4M0IOe6t8C8vkIKi
	au8aza69a5xDbYIEzq9FjohR4cI2MpwCjCxdsRQYtv7c5Sj17LDIBProA9U2H2mO9fkN
	oK7w==
X-Gm-Message-State: AOAM533NrCmQZ7/33TYRjXwPGsKSCGqlMcJuaBkNS/m99IevBLcRFjgz
	5dVrBDh/bEx5oHiQ48ZYPy13cW7C
X-Google-Smtp-Source: ABdhPJy3u9X/LZrEBcnzHqIvih1ekiphmh5VUfl1+yQGnTTGpvo6N+vJ9ZGQt4Y2BPOksFGy57bw6Q==
X-Received: by 2002:a37:9a46:: with SMTP id c67mr12141851qke.85.1595612859966; 
	Fri, 24 Jul 2020 10:47:39 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id b8sm2182059qtg.45.2020.07.24.10.47.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jul 2020 10:47:39 -0700 (PDT)
Date: Fri, 24 Jul 2020 13:47:38 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200724174738.GA84895@lobo>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fix for 5.8-rc7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit 6958c1c640af8c3f40fa8a2eee3b5b905d95b677:

  dm: use noio when sending kobject event (2020-07-08 12:50:51 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.8/dm-fixes-3

for you to fetch changes up to 5df96f2b9f58a5d2dc1f30fe7de75e197f2c25f2:

  dm integrity: fix integrity recalculation that is improperly skipped (2020-07-23 14:39:37 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Stable fix for DM integrity target's integrity recalculation that
  gets skipped when resuming a device. This is a fix for a previous
  stable@ fix.

----------------------------------------------------------------
Mikulas Patocka (1):
      dm integrity: fix integrity recalculation that is improperly skipped

 drivers/md/dm-integrity.c     |  4 ++--
 drivers/md/dm.c               | 17 +++++++++++++++++
 include/linux/device-mapper.h |  1 +
 3 files changed, 20 insertions(+), 2 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

