Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 344C01951CD
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 08:15:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585293335;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iInlmZP2XXFyT59K3Zn0yoN49vsbrlyZTV5h45p+Ahs=;
	b=IgetYbvJ0PmanRVWR/4tTfCw8S2Bb8TMrrrI1nrzODJG5wP2Ov8amxrpWiX3GvKaLddxLC
	Y33XEKsp3Qp5TvZDoLdDjJh64fG4p2AY/N/YKzGvzPATe09W8bi6b7XIFW2S18Y4Ge7Vy9
	aLXj8Tb2td4JLeBSu90rEHm2OvTWjfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-3WNGE1ZrNG2D0mRbOu1p5Q-1; Fri, 27 Mar 2020 03:15:33 -0400
X-MC-Unique: 3WNGE1ZrNG2D0mRbOu1p5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ADCEDB24;
	Fri, 27 Mar 2020 07:15:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0231910016DA;
	Fri, 27 Mar 2020 07:15:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C133F8A022;
	Fri, 27 Mar 2020 07:15:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02R7FFcw027387 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 03:15:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 948EE2037E57; Fri, 27 Mar 2020 07:15:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90CC42037E4D
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:15:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7817800297
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:15:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-436-A0Ns2vKINIGLUL5byuGEsA-1;
	Fri, 27 Mar 2020 03:15:10 -0400
X-MC-Unique: A0Ns2vKINIGLUL5byuGEsA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id AF7C3B213;
	Fri, 27 Mar 2020 07:15:08 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 27 Mar 2020 08:14:55 +0100
Message-Id: <20200327071459.67796-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02R7FFcw027387
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH RFC 0/4] dm-zoned: Metadata V2
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

here's a patchset to add UUIDs and labels to the metadata,
increasing the metadata version number to 2.
This allows to identify the various devices, and also to
have a persistent device-mapper name based on the label.
To handle and generate these new values I've also send
a pull request to the upstream dm-zoned-tools git repository.

This patchset requires the previous patch to add status
and message callbacks.

As usual, comments and reviews are welcome.

Hannes Reinecke (4):
  dm-zoned: store zone id within the zone structure
  dm-zoned: use array for superblock zones
  dm-zoned: V2 metadata handling
  dm-zoned: allow for device size smaller than the capacity

 drivers/md/dm-zoned-metadata.c | 117 ++++++++++++++++++++++++++++++-----------
 drivers/md/dm-zoned-target.c   |   4 +-
 drivers/md/dm-zoned.h          |   3 ++
 3 files changed, 91 insertions(+), 33 deletions(-)

-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

