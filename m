Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5C07D112D35
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 15:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575468454;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JS2hYsD6HPLacBfTpFGE+QlRJLASP36aSGfBZz9GE3Y=;
	b=BGuIGQfzX4JuG3pu5ZR3TtgAbu3HHgqZN0wFLjGodAThojGxPAqwDsGxgBUu/fdEF1JhmP
	Mc6Tha8l6EcDvB3cPSPiwjS6FiYAFkEFStIB/002iVDMqlt6YCJUZyb59Alwm1Sma3HN36
	wSiZZfejDy8vWdFUrNS7CT6aPzmy1/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-wyxnyEQBPyS0_qMY8CizTA-1; Wed, 04 Dec 2019 09:07:32 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0FC510A200C;
	Wed,  4 Dec 2019 14:07:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D665951C35;
	Wed,  4 Dec 2019 14:07:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52DD25BC09;
	Wed,  4 Dec 2019 14:07:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E76fn006851 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:07:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9BD711793C; Wed,  4 Dec 2019 14:07:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E43117916
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EC87185B0B2
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-36-a4r3RkZYMDu5KZnZ34NCFw-1; Wed, 04 Dec 2019 09:07:02 -0500
Received: by mail-lf1-f49.google.com with SMTP id q6so6224362lfb.6
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 06:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VyLHeWo1IVwTXJlMm1IiZ3/MNI4cr1AOGINJlNr2F4M=;
	b=C8HnQA3mbZu+xOMyI7N65HVl0t4eVyVYKqpTUepfOSdlJaP3D6TOxTwqHwvNpD/3+j
	7BIjlX+TwIA5rpH7d0Tvge8xuiHGu/rcX9uGm+FVYZyG7BBy/BBRUffPtdihsYtzeDwm
	8YJDh0cFufNDcD8cvnyWx5/741dl7+RzmMcPB/fE8nTBW6uK3ETbmAkeCF/W5NxANQ3Y
	AihFT5NN1cxIGhF1Cl1BlPjhzq+8AvzIOHRvE+ZRI2Dnh0pcytsj/2ur8/2ES83WJ8WQ
	Jx+jwUFJHNSbNjo3hsZL3WTVwZvxrAA/Fp1mM60bcg8bWjUPxiECh4Uzlq9Rm+fk4ImM
	FuVg==
X-Gm-Message-State: APjAAAW0unXplHyClXkFoSkK3F8DjRUwoZvZQfNrz9GJ5cT7sp3j1FkQ
	40SP3ENlPxNR2hxOmfMNrVTQVw==
X-Google-Smtp-Source: APXvYqzGjQgnnu5UKXBh4Do+aHwtQfYrLXUF6UO7++fEKvz5GpmWoho5VpXWVw1N34/FRSsLIgphsA==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr2184207lfl.185.1575468420399; 
	Wed, 04 Dec 2019 06:07:00 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	i19sm3335533ljj.24.2019.12.04.06.06.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 06:06:59 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed,  4 Dec 2019 16:06:51 +0200
Message-Id: <20191204140654.26214-1-ntsironis@arrikto.com>
X-MC-Unique: a4r3RkZYMDu5KZnZ34NCFw-1
X-MC-Unique: wyxnyEQBPyS0_qMY8CizTA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4E76fn006851
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [PATCH 0/3] dm clone: Flush destination device before
	committing metadata to avoid data corruption
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-clone maintains an on-disk bitmap which records which regions are
valid in the destination device, i.e., which regions have already been
hydrated, or have been written to directly, via user I/O.

Setting a bit in the on-disk bitmap meas the corresponding region is
valid in the destination device and we redirect all I/O regarding it to
the destination device.

Suppose the destination device has a volatile write-back cache and the
following sequence of events occur:

1. A region gets hydrated, either through the background hydration or
   because it was written to directly, via user I/O.

2. The commit timeout expires and we commit the metadata, marking that
   region as valid in the destination device.

3. The system crashes and the destination device's cache has not been
   flushed, meaning the region's data are lost.

The next time we read that region we read it from the destination
device, since the metadata have been successfully committed, but the
data are lost due to the crash, so we read garbage instead of the old
data.

For more information regarding the implications of this please see the
relevant commit.

To solve this and avoid the potential data corruption we have to flush
the destination device before committing the metadata.

This ensures that any freshly hydrated regions, for which we commit the
metadata, are properly written to non-volatile storage and won't be lost
in case of a crash.

Nikos Tsironis (3):
  dm clone metadata: Track exact changes per transaction
  dm clone metadata: Use a two phase commit
  dm clone: Flush destination device before committing metadata

 drivers/md/dm-clone-metadata.c | 136 ++++++++++++++++++++++++++++++-----------
 drivers/md/dm-clone-metadata.h |  17 ++++++
 drivers/md/dm-clone-target.c   |  53 +++++++++++++---
 3 files changed, 162 insertions(+), 44 deletions(-)

-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

