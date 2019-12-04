Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 482CB112D3A
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 15:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575468487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nkx7tWTJMlkcNdWgJvoJV3riFtxRalzr37S7SYtnE9E=;
	b=SJwCVWxmA+oOCt5FDbR3EJHiQnorDz1cWII0A/7ZquP118SRtjnWFKZiK52qyW7D/bxpEk
	tKDXG40DIy9rUvgfssbq9syt5RzxJBrD/Y4EKvzM0zuiJK+2lFwMIz8VteAH7wFie0aXRz
	nBTcTNqAhjFRpl2FRqhoydlAyplX+MM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-_FHbBi92PeWmShdGrfKwuQ-1; Wed, 04 Dec 2019 09:08:04 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46E3E85EE6A;
	Wed,  4 Dec 2019 14:07:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6CB60850;
	Wed,  4 Dec 2019 14:07:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A07CB18095FF;
	Wed,  4 Dec 2019 14:07:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E7qiG007069 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:07:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 684662026D67; Wed,  4 Dec 2019 14:07:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 638DB2026D68
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2578A801E6C
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:50 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-202-g_fcT8z2Me6UwekQkE9oRg-1; Wed, 04 Dec 2019 09:07:48 -0500
Received: by mail-lj1-f194.google.com with SMTP id k8so8257976ljh.5
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 06:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/wATRaf2MzK58QcgvZRtzv1ZJzfV7TC/T9eKSG9NyMc=;
	b=nx26qi8vhxHAWjU22jZpZXoOYG42Ak6NodON3JkdqUe25wGZcYQCcdx/5beShU8SXG
	O0gUtpS6xW030zdmrrmxrj1YCuOHtdjVfhMnyYYKimFXRkHFGEqxPcDVMPGjLDM6oQ56
	vosfAzTgV5juJzGby6AtzPDGk3P4GWVsRYi9TCQUiUVfKdv64wexT/NLvs6yTKrzZP9F
	PdtaTDiZjid0a7ETzd+Jt/FrKYiPxa9hDWyZwtqXYomlcvh5h3tKEDEUb3dtkYLLO67/
	3x1mhGthULXXyITZHiq1qZ1vArDiIxpi2Kb/c3MGl/bd7lHPlhbuS+WAN4PaDOMu5eDn
	5bjA==
X-Gm-Message-State: APjAAAVZhYPl/6Q/77IDzLmkWqwXC6mV48B6Kia56hLEbjgVsgWe7jqn
	8SM2GscDTFh88ZCYQ5xBHlH87Q==
X-Google-Smtp-Source: APXvYqxRLvnqqX86A33sHjheC8qGIudASv5dX0LfQS3bBR6YHAywyRCwqt+AvAyQqDAKabPdI16mKw==
X-Received: by 2002:a2e:918c:: with SMTP id f12mr2141768ljg.66.1575468465935; 
	Wed, 04 Dec 2019 06:07:45 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id n3sm3350450lfk.61.2019.12.04.06.07.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 06:07:45 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed,  4 Dec 2019 16:07:40 +0200
Message-Id: <20191204140742.26273-1-ntsironis@arrikto.com>
X-MC-Unique: g_fcT8z2Me6UwekQkE9oRg-1
X-MC-Unique: _FHbBi92PeWmShdGrfKwuQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4E7qiG007069
X-loop: dm-devel@redhat.com
Cc: thornber@redhat.com, ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 0/2] dm thin: Flush data device before committing
	metadata to avoid data corruption
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The thin provisioning target maintains per thin device mappings that map
virtual blocks to data blocks in the data device.

When we write to a shared block, in case of internal snapshots, or
provision a new block, in case of external snapshots, we copy the shared
block to a new data block (COW), update the mapping for the relevant
virtual block and then issue the write to the new data block.

Suppose the data device has a volatile write-back cache and the
following sequence of events occur:

1. We write to a shared block
2. A new data block is allocated
3. We copy the shared block to the new data block using kcopyd (COW)
4. We insert the new mapping for the virtual block in the btree for that
   thin device.
5. The commit timeout expires and we commit the metadata, that now
   includes the new mapping from step (4).
6. The system crashes and the data device's cache has not been flushed,
   meaning that the COWed data are lost.

The next time we read that virtual block of the thin device we read it
from the data block allocated in step (2), since the metadata have been
successfully committed. The data are lost due to the crash, so we read
garbage instead of the old, shared data.

Moreover, apart from internal and external snapshots, the same issue
exists for newly provisioned blocks, when block zeroing is enabled.
After the system recovers the provisioned blocks might contain garbage
instead of zeroes.

For more information regarding the implications of this please see the
relevant commit.

To solve this and avoid the potential data corruption we have to flush
the pool's data device before committing its metadata.

This ensures that the data blocks of any newly inserted mappings are
properly written to non-volatile storage and won't be lost in case of a
crash.

Nikos Tsironis (2):
  dm thin metadata: Add support for a pre-commit callback
  dm thin: Flush data device before committing metadata

 drivers/md/dm-thin-metadata.c | 29 +++++++++++++++++++++++++++++
 drivers/md/dm-thin-metadata.h |  7 +++++++
 drivers/md/dm-thin.c          | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

