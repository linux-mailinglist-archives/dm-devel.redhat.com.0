Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7515D24453C
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:07:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-aAjvRCo2M1iVJMaJsvUWqw-1; Fri, 14 Aug 2020 03:07:25 -0400
X-MC-Unique: aAjvRCo2M1iVJMaJsvUWqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81D3A1853DB1;
	Fri, 14 Aug 2020 07:07:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A5E51002382;
	Fri, 14 Aug 2020 07:07:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17AD5181A271;
	Fri, 14 Aug 2020 07:07:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E72orT006359 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 03:02:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A81B8110C57A; Fri, 14 Aug 2020 07:02:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3AF4110C578
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:02:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40C4A80088F
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:02:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-377-rj4xxipfOwuXqYFsMEKTkQ-1; Fri, 14 Aug 2020 03:02:41 -0400
X-MC-Unique: rj4xxipfOwuXqYFsMEKTkQ-1
Received: by mail-wr1-f50.google.com with SMTP id a5so7407930wrm.6;
	Fri, 14 Aug 2020 00:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+ytoOyn3OrI2lGVFxmY4HgXuf5BgTgZI4BeBO5ABZrE=;
	b=h51PIqQEOyXsuQaltjsQKJoHn0QCzTmlDvuBthxUSNwMpYhmoxCsg/kjgileoUdof7
	SL83Xu43dmv8fDvFT8wB4dLeIFiU6qHe4V32A7XMzJi6MpMtQr7CHaWaRJNoui53N/j3
	InGygOc4apo9eF08K06TUk3/kzunqZqhKceOHtybv456EOJUQpRKkb75BxvycoLJ52rN
	0lG61mjHahYxc+l+Fd+WcYvpKmYx1jPqyp5bfRGChHPowE/roGJ3LvzzlW2xhGoP9Zfy
	qpZ8YyCDXHWwEqC0QjwekoQhVoAAo2hfwjSUxtVJnTvnq2kgahiI/B9hiRwMsFFOyWl5
	k12g==
X-Gm-Message-State: AOAM530gL5+Z3APaySQqYoYspwf3JQlesHMu3vfpYtUpF8+1I26EBm7w
	r6QmVGGPR1+DyGyVChRWIPE=
X-Google-Smtp-Source: ABdhPJwYqijp9QX7wIXUkWLCTJOejyUQdH0epva1BjXn3u3yZ8CT0jkomOJIJpcDXQoYokuCO2C0UQ==
X-Received: by 2002:adf:b302:: with SMTP id j2mr1368441wrd.294.1597388559816; 
	Fri, 14 Aug 2020 00:02:39 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:51f:3472:bc7:2f4f?
	([2601:647:4802:9070:51f:3472:bc7:2f4f])
	by smtp.gmail.com with ESMTPSA id
	z8sm12425651wmf.10.2020.08.14.00.02.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 14 Aug 2020 00:02:39 -0700 (PDT)
To: Christoph Hellwig <hch@infradead.org>
References: <510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com> <20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<20200813153623.GA30905@infradead.org>
	<20200813174704.GA6137@redhat.com>
	<20200813184349.GA8191@infradead.org>
	<96aff2d0-5907-f5c9-9164-8fea0d030d95@grimberg.me>
	<20200814065559.GA29917@infradead.org>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <9cced4a7-aafa-23c8-ad4b-d19e0b136585@grimberg.me>
Date: Fri, 14 Aug 2020 00:02:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814065559.GA29917@infradead.org>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>, Ewan Milne <emilne@redhat.com>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit


>>> +	switch (nvme_req_disposition(req)) {
>>> +	case COMPLETE:
>>> +		nvme_complete_req(req);
>>
>> nvme_complete_rq calling nvme_complete_req... Maybe call it
>> __nvme_complete_rq instead?
> 
> That's what I had first, but it felt so strangely out of place next
> to the other nvme_*_req calls..
> 
> Maybe nvme_complete_rq needs to be renamed - what about nvme_req_done?

I'd suggest to call nvme_complete_rq nvme_end_rq because it really calls
blk_mq_end_request. That would confuse with nvme_end_request which
calls blk_mq_complete_request... Maybe we need some naming improvements
throughout.

>> Maybe call nvme_req_disposition again locally here to not carry
>> the is_ana_status. But not a biggy..
> 
> That means it would have to become non-static in scope, limiting
> inlining possibilities, etc.

I see.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

