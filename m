Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 058CC15C29F
	for <lists+dm-devel@lfdr.de>; Thu, 13 Feb 2020 16:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581608246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w/tNjwWfoBJgk0jieg1RltbIKJPU9XmH0wF40B5keZA=;
	b=jJlGf/EM0j56avFHLtbLskALQFixHdDt7h/UI3EBwNAfPL057Tumb2VH7lUWpk+Yav3tPP
	15mLL6CZNl5AwDE5nV5vn7ckEaBKc14RyXQY+viwMgRjKKF0y34nt59eVBFjJ0fpyW0sM7
	G2+2nU7Zq6asWMeeC38dP3NBVVNFAfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-iVS62DO5OTK_pwcE90c2jA-1; Thu, 13 Feb 2020 10:37:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78E05DB60;
	Thu, 13 Feb 2020 15:37:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0C9271B5;
	Thu, 13 Feb 2020 15:37:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 479A718089CD;
	Thu, 13 Feb 2020 15:37:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DFan4D014663 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 10:36:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CEF0D5DA8C; Thu, 13 Feb 2020 15:36:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A17CD5DA85;
	Thu, 13 Feb 2020 15:36:46 +0000 (UTC)
Date: Thu, 13 Feb 2020 10:36:45 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
Message-ID: <20200213153645.GA11313@redhat.com>
References: <20200213141823.2174236-1-mplaneta@os.inf.tu-dresden.de>
MIME-Version: 1.0
In-Reply-To: <20200213141823.2174236-1-mplaneta@os.inf.tu-dresden.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Chao Yu <chao@kernel.org>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	linux-crypto@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] Remove WQ_CPU_INTENSIVE flag from unbound wq's
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
X-MC-Unique: iVS62DO5OTK_pwcE90c2jA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 13 2020 at  9:18am -0500,
Maksym Planeta <mplaneta@os.inf.tu-dresden.de> wrote:

> The documentation [1] says that WQ_CPU_INTENSIVE is "meaningless" for
> unbound wq. I remove this flag from places where unbound queue is
> allocated. This is supposed to improve code readability.
> 
> 1. https://www.kernel.org/doc/html/latest/core-api/workqueue.html#flags
> 
> Signed-off-by: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>

What the Documentation says aside, have you cross referenced with the
code?  And/or have you done benchmarks to verify no changes?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

