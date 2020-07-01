Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 84A8921121E
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 19:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593625361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V4NWcRwW9mXOdZwm/RQIz43sc8L/vD5dbl2QAuTtqY8=;
	b=Ly9dsLbto6c7kKuGoDC0B3kryH251g0HQ7Pl9WJSDK+jiJZjrdxLCfzkM+pYvEp76t73Lb
	6i0L5W1BJuB0wOk6tNcJx49yo8Vsc/Lzjt1fdu+0693bja5heUCn/GnfMuJNgwP+2uBP77
	W4HTKfX4rmcd0SAvxdYArapyRIyorPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-ODYNycZpNJCm-kUnZbDJ0Q-1; Wed, 01 Jul 2020 13:42:39 -0400
X-MC-Unique: ODYNycZpNJCm-kUnZbDJ0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958291940921;
	Wed,  1 Jul 2020 17:42:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0188A741AA;
	Wed,  1 Jul 2020 17:42:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED2011809543;
	Wed,  1 Jul 2020 17:42:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061Hf5Z0017510 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 13:41:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9EF15C6DD; Wed,  1 Jul 2020 17:41:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93E7D5C6C0;
	Wed,  1 Jul 2020 17:41:02 +0000 (UTC)
Date: Wed, 1 Jul 2020 12:39:42 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Message-ID: <20200701163942.GB27063@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, John Meneghini <johnm@netapp.com>,
	Ewan Milne <emilne@redhat.com>
Subject: [dm-devel] NVMe regression, NVMe no longer uses blk_path_error()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

IF NVMe's isn't a primary user of blk_path_error() it largely kills
the entire point of blk_path_error(). (And no the response to this must
not be: "that's fine")

This commit shows NVMe's previous continued use of blk_path_error():

  8decf5d5b9f3f7 ("nvme: remove nvme_req_needs_failover")

but then nvme_failover_req() was relatively recently refactored with:

  764e9332098c0 ("nvme-multipath: do not reset on unknown status")

NVMe should've continued to use blk_path_error().  If there was some gap
in error classification that should've been fixed in NVMe.

Instead, with commit 764e9332098c0 NVMe is no longer using retryable
error classifications commonly maintained within block core.  As such it
introduces serious potential for regression with DM multipath no longer
having a shared understanding for what _really_ constitutes a retryable
blk_status_t from NVMe.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

