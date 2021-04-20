Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 401F8366219
	for <lists+dm-devel@lfdr.de>; Wed, 21 Apr 2021 00:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618956855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+34PK45vwp6grOoGedjli/ZM97dzo23aDaFngZa1Sss=;
	b=VVcOK/l5zxVrxhMth/CLyYMyMck7H/+R4aEdzb1EZO+FA8CiL8JZHhNbsr6heZuZqLGB0+
	MadRuBgdi1U+Om1+iMyRmTA760BJtqjZ5KFBjzJvXK9AAzMyjheTc+fEcWnFOi3oJEkpOn
	rMLLzXBglgz+6/Y4NcRTMLHCyvfT0Kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-06muvkDyMyO5POvhsEgQJQ-1; Tue, 20 Apr 2021 18:14:08 -0400
X-MC-Unique: 06muvkDyMyO5POvhsEgQJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 762EC87504E;
	Tue, 20 Apr 2021 22:14:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 920215D6AD;
	Tue, 20 Apr 2021 22:13:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA21E4ED86;
	Tue, 20 Apr 2021 22:13:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13KMDN2k021336 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 18:13:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1B2419701; Tue, 20 Apr 2021 22:13:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFEF519D9B;
	Tue, 20 Apr 2021 22:13:23 +0000 (UTC)
Date: Tue, 20 Apr 2021 18:13:23 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <20210420221322.GA16676@redhat.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<d17978db8a2bae019d2c858a51e9f6abf8ea8947.1605896059.git.gustavoars@kernel.org>
	<02133499-e619-77e6-7ec0-79a238258f81@embeddedor.com>
MIME-Version: 1.0
In-Reply-To: <02133499-e619-77e6-7ec0-79a238258f81@embeddedor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 077/141] dm raid: Fix fall-through warnings
	for Clang
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 20 2021 at  4:15pm -0400,
Gustavo A. R. Silva <gustavo@embeddedor.com> wrote:

> Hi all,
> 
> Friendly ping: who can take this, please?
> 
> Thanks
> --
> Gustavo
> 
> On 11/20/20 12:35, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of letting the code fall
> > through to the next case.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/md/dm-raid.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> > index 9c1f7c4de65b..e98af0b9d00c 100644
> > --- a/drivers/md/dm-raid.c
> > +++ b/drivers/md/dm-raid.c
> > @@ -1854,6 +1854,7 @@ static int rs_check_takeover(struct raid_set *rs)
> >  		    ((mddev->layout == ALGORITHM_PARITY_N && mddev->new_layout == ALGORITHM_PARITY_N) ||
> >  		     __within_range(mddev->new_layout, ALGORITHM_LEFT_ASYMMETRIC, ALGORITHM_RIGHT_SYMMETRIC)))
> >  			return 0;
> > +		break;
> >  
> >  	default:
> >  		break;
> > 
> 

I've picked it up for 5.13, thanks.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

