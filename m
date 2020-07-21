Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 34EC72287DB
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jul 2020 20:00:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595354412;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MzRK85ehwRdsPFDqhCTnFXYRZ/e5+KiWWZ8kDfRfilE=;
	b=GrMhyv6r1vpoHBMuQWg67zwjGb5OSJd28lfvC+p8hWZsY335d6Wh20qKXCbJojicY0Si4g
	jb/Cp1e/YwVl8c/5o+RBIjj49gD75wQ5F8U3lVcxg4CYOb7YTjfuOF5sibcCn9aY9t/yud
	jX77DI16zNJkVBgN4JeeenSgxnlT/CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-Xwz2edq6MdGCu6mUyC6wTw-1; Tue, 21 Jul 2020 14:00:09 -0400
X-MC-Unique: Xwz2edq6MdGCu6mUyC6wTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A739800474;
	Tue, 21 Jul 2020 17:59:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8DA61177;
	Tue, 21 Jul 2020 17:59:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E98831809554;
	Tue, 21 Jul 2020 17:59:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LHWiZv011450 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 13:32:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D020372686; Tue, 21 Jul 2020 17:32:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 530BA72683;
	Tue, 21 Jul 2020 17:32:41 +0000 (UTC)
Date: Tue, 21 Jul 2020 13:32:40 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200721173240.GA21963@redhat.com>
References: <20200720061251.652457-1-hch@lst.de>
	<20200720061251.652457-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200720061251.652457-2-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, Damien.LeMoal@wdc.com,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/3] block: inherit the zoned characteristics
 in blk_stack_limits
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 20 2020 at  2:12am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Lift the code from device mapper into blk_stack_limits to inherity
> the stacking limitations.  This ensures we do the right thing for
> all stacked zoned block devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

