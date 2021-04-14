Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A12635FAC3
	for <lists+dm-devel@lfdr.de>; Wed, 14 Apr 2021 20:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618425644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n9JJy+hJ2vZy3F3LEThZ+Iu3RTPt4JIekmYNYkFgeQw=;
	b=UjGOzjh+kN0BOWUmqWVU8Av1a4calku3gN2PCM5a+kR5OgU2zvCd72Zy4uVxNb8kSxzwiE
	pyObN3fsayj9t+jaEmhs7bdXk0TgVywETYfOv7ylFMs4PAgVqiqJAXLKfVQXt6t/3uPT7j
	QJ21mWhTrMk7QX3lF0zmfc/2dBSTLZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-9irxrjqVOH27PTzVNw-Ukw-1; Wed, 14 Apr 2021 14:40:41 -0400
X-MC-Unique: 9irxrjqVOH27PTzVNw-Ukw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC6A61020C3D;
	Wed, 14 Apr 2021 18:40:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A17041000324;
	Wed, 14 Apr 2021 18:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9ECE44A5B;
	Wed, 14 Apr 2021 18:40:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13EIe8du004125 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 14:40:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DE0C5DEAD; Wed, 14 Apr 2021 18:40:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F3415D9DE;
	Wed, 14 Apr 2021 18:40:08 +0000 (UTC)
Date: Wed, 14 Apr 2021 14:40:07 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210414184007.GA8824@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jaegeuk Kim <jaegeuk@google.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fix for 5.12 final
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:

  Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.12/dm-fixes-3

for you to fetch changes up to 8ca7cab82bda4eb0b8064befeeeaa38106cac637:

  dm verity fec: fix misaligned RS roots IO (2021-04-14 14:28:29 -0400)

Please pull, thanks.
Mike

----------------------------------------------------------------
Fix DM verity target FEC support's RS roots IO to always be
aligned. This fixes a previous stable@ fix that overcorrected for a
different configuration that also resulted in misaligned roots IO.

----------------------------------------------------------------
Jaegeuk Kim (1):
      dm verity fec: fix misaligned RS roots IO

 drivers/md/dm-verity-fec.c | 11 ++++++++---
 drivers/md/dm-verity-fec.h |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

