Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD2C2110E7
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 18:41:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-cbNUzZw9OpWoX8NZReGtLw-1; Wed, 01 Jul 2020 12:41:56 -0400
X-MC-Unique: cbNUzZw9OpWoX8NZReGtLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4D35106BF7D;
	Wed,  1 Jul 2020 16:41:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C95571662;
	Wed,  1 Jul 2020 16:41:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC3241809543;
	Wed,  1 Jul 2020 16:41:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061GcNRM010196 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 12:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6CA92144B52; Wed,  1 Jul 2020 16:38:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C23502144B53
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 16:38:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C718E924907
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 16:38:20 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
	[209.85.219.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-HLCE5n9ZMSaPLvsWtxVw5g-1; Wed, 01 Jul 2020 12:38:16 -0400
X-MC-Unique: HLCE5n9ZMSaPLvsWtxVw5g-1
Received: by mail-qv1-f42.google.com with SMTP id m9so11302584qvx.5
	for <dm-devel@redhat.com>; Wed, 01 Jul 2020 09:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=tnWfjqu9qwTdD4KnQK/3+SjWTBx9SJibvmRRCZ2MKpw=;
	b=Zuxrm833bkUSGbJoMifQmvav7S+0kH89cg1QEtgYEXQWSHFGtv3hzPH5rHrKz1ifDz
	mFHeKD+ortGvzSgg/nBu6kShUOl+0PeUPgxVNtLyKP0c972lEYPNWXYFmLWt0tCdQuuZ
	pWFWGxtMI4tbMCpjgyMbtAGU7ZlUeM4klw2jvWyxtGSga/rBl/f2R6I7V9RjyT6lssPT
	hUN1BmR7wgUMxM+OznlI7GcVRqT/5bHsDLzZh0+pzMz3V1shpPIFiz0LdpLHVMRDnQhj
	DcAuIi0zkBa6iwqlHwlIAFCjP+SnrqdwtlAGLBsKtoY+sFDxE3vK3yX/Fz2PKIpmWUCg
	LnAQ==
X-Gm-Message-State: AOAM53234vIFiyKpLZ/maEjKLrR4iovdQj/39oR7/z5LARazR1gfSEkN
	b9oYSvzjQ//XxWUo/DQos3U=
X-Google-Smtp-Source: ABdhPJzfqJE8PIES5DnR2PTCVTamwJmruYSeMWZpKr4HJeNZUuy5RzchyjxSpfzGXXbaj1X8ONNd6g==
X-Received: by 2002:a05:6214:10e1:: with SMTP id
	q1mr24708355qvt.78.1593621495518; 
	Wed, 01 Jul 2020 09:38:15 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:f839])
	by smtp.gmail.com with ESMTPSA id u1sm5792798qkf.49.2020.07.01.09.38.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jul 2020 09:38:14 -0700 (PDT)
Date: Wed, 1 Jul 2020 12:38:13 -0400
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200701163813.GA5046@mtj.thefacebook.com>
References: <20200701090622.3354860-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	cgroups@vger.kernel.org, linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 01, 2020 at 11:06:18AM +0200, Christoph Hellwig wrote:
> Hi Jens,
> 
> we have a lot of bdi congestion related code that is left around without
> any use.  This series removes it in preparation of sorting out the bdi
> lifetime rules properly.

Acked-by: Tejun Heo <tj@kernel.org>

Thanks a lot for killing the dead code.

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

