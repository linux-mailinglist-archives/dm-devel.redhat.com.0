Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 26F83247EBD
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 08:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597733653;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sIThlfD/Zn8NDnIZbz1QhQ7mLc2NVFcdWEEUnzF1rIQ=;
	b=NzEe691hH/NzrP+yr2qh3uT+uMdybGvEB8LLB9++lJcwsiAKggwGKAq5yd7zfoCgTuUJbq
	+KcUOtTec/Frw/hBzrxdu72kRMTePcQYlA7IhaRVEV0CMl69nzJtnIR53e01+zan8CfNRj
	TQf1RGv5j9IGoE8JwCeKasX6XaGeUQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-p2cxAHfQO2KVMDGkxiMH6A-1; Tue, 18 Aug 2020 02:54:10 -0400
X-MC-Unique: p2cxAHfQO2KVMDGkxiMH6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B2A91DDEF;
	Tue, 18 Aug 2020 06:54:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E355F10027A6;
	Tue, 18 Aug 2020 06:53:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 642D424AB8;
	Tue, 18 Aug 2020 06:53:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07I6plil018121 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 02:51:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C1C87D92C; Tue, 18 Aug 2020 06:51:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CDA37D939;
	Tue, 18 Aug 2020 06:51:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07I6pfZQ025749; 
	Tue, 18 Aug 2020 01:51:41 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07I6peYa025748;
	Tue, 18 Aug 2020 01:51:40 -0500
Date: Tue, 18 Aug 2020 01:51:40 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200818065140.GN19233@octiron.msp.redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<4127cfc2-413f-32d9-cf76-0c0453524aeb@huawei.com>
	<dbe521bcacbc746969437612d639387663898f88.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <dbe521bcacbc746969437612d639387663898f88.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 4/6] libmultipath: check blist before calling
 MALLOC in alloc_ble_device func
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Aug 17, 2020 at 10:51:49AM +0200, Martin Wilck wrote:
> On Sun, 2020-08-16 at 09:45 +0800, Zhiqiang Liu wrote:
> > In alloc_ble_device func, ble is firstly allocated by calling MALLOC,
> > and then input blist is checked whether it is valid. If blist is not
> > valid, ble will be freed without using.
> > 
> > Here, we should check blist firstly.
> > 
> > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> > ---
> >  libmultipath/blacklist.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> This patch isn't wrong, but it fixes code which isn't buggy. It's
> rather a style thing, an optimization for an extremely unlikely error
> case. I agree with you in the sense that I prefer the "new" style over
> the old (I generally dislike expressions that can fail, like malloc()
> calls, being used as variable initializers), but I'm not sure if we
> should start applying patches for cases like this. So far we've been
> rather conservative with "style" patches, because they tend to make it
> unnecessarily hard to track code history.
> 
> Ben, Christophe, what's your take on this matter?

While I'm not really a fan of whitespace tweaking patches, I'm fine with
this. All things being equal, I really do prefer it when functions check
their arguments first, instead of doing possibly unnecessary work.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
 
> Regards,
> Martin
> 
> 
> > 
> > diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
> > index db58ccc..bedcc7e 100644
> > --- a/libmultipath/blacklist.c
> > +++ b/libmultipath/blacklist.c
> > @@ -66,12 +66,16 @@ out:
> > 
> >  int alloc_ble_device(vector blist)
> >  {
> > -	struct blentry_device * ble = MALLOC(sizeof(struct
> > blentry_device));
> > +	struct blentry_device *ble;
> > 
> > +	if (!blist)
> > +		return 1;
> > +
> > +	ble = MALLOC(sizeof(struct blentry_device));
> >  	if (!ble)
> >  		return 1;
> > 
> > -	if (!blist || !vector_alloc_slot(blist)) {
> > +	if (!vector_alloc_slot(blist)) {
> >  		FREE(ble);
> >  		return 1;
> >  	}
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

