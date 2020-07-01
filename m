Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 91ADD21121F
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 19:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593625362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AV4KpeOLWpUqqZupXLovSRCU31ToAbsl3mpY50e0M+M=;
	b=HC3pKi1J7sbpjM79FSmanASEVnFfsVT2cdv0h1tuVOk1bow/hgwtzxOp5DSbdcEyur+kWk
	TpyRmOzlF+bZ/NV7eS3/yRFf/HYECA0yaT/9Mmp3ipDkX/5PJxbSfNsBFBQKTRvhPSlG/K
	SkFOfhdABGdgIkNG+hAS3po2uv4+5BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-7pklvl5QPVu5fIFAPcVapg-1; Wed, 01 Jul 2020 13:42:39 -0400
X-MC-Unique: 7pklvl5QPVu5fIFAPcVapg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A5C800FF2;
	Wed,  1 Jul 2020 17:42:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB4B28560;
	Wed,  1 Jul 2020 17:42:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA08A6C9C6;
	Wed,  1 Jul 2020 17:42:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061HgQZU017779 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 13:42:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C419679222; Wed,  1 Jul 2020 17:42:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B13D379220;
	Wed,  1 Jul 2020 17:42:23 +0000 (UTC)
Date: Wed, 1 Jul 2020 12:41:03 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200701164103.GC27063@redhat.com>
References: <20200701090622.3354860-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mm@kvack.org,
	linux-bcache@vger.kernel.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, Tejun Heo <tj@kernel.org>,
	linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] remove dead bdi congestion leftovers
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 01 2020 at  5:06am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Hi Jens,
> 
> we have a lot of bdi congestion related code that is left around without
> any use.  This series removes it in preparation of sorting out the bdi
> lifetime rules properly.

I could do some git archeology to see what the fs, mm and block core
changes were to stop using bdi congested but a pointer to associated
changes (or quick recap) would save me some time.

Also, curious to know how back-pressure should be felt back up the IO
stack now? (apologies if these are well worn topics, I haven't been
tracking this area of development).

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

