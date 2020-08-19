Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 24579249876
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 10:46:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-eliO-uGWMuOh5coE7Kgx9A-1; Wed, 19 Aug 2020 04:46:09 -0400
X-MC-Unique: eliO-uGWMuOh5coE7Kgx9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25A98186A563;
	Wed, 19 Aug 2020 08:46:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C481E5D9E8;
	Wed, 19 Aug 2020 08:46:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FE594EE1D;
	Wed, 19 Aug 2020 08:45:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07J8jk1I018977 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 04:45:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01006110F0A1; Wed, 19 Aug 2020 08:45:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0A67110F0A7
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 08:45:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0A07984BA7
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 08:45:42 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-475-D6YEicCgM4243Na5E0bjcQ-1; Wed, 19 Aug 2020 04:45:40 -0400
X-MC-Unique: D6YEicCgM4243Na5E0bjcQ-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 975434DF1D4F7F1FDB19;
	Wed, 19 Aug 2020 16:45:31 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 19 Aug 2020
	16:45:24 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<e15fee1e-145b-2880-c84a-aba7b1496555@huawei.com>
	<d76537854b7e9171738cf8db094319088bb13c3a.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <8dcc835f-5cda-89d5-acb6-67af1fe7bb78@huawei.com>
Date: Wed, 19 Aug 2020 16:45:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d76537854b7e9171738cf8db094319088bb13c3a.camel@suse.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
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
Cc: linfeilong@huawei.com, dm-devel mailing list <dm-devel@redhat.com>,
	liuzhiqiang26@huawei.com
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath fix daemon memory leak in
 disassemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Martin,
   Thanks for your answers. I understand the relationship between branches.

On 2020/8/19 16:26, Martin Wilck wrote:
> Hello lixiaokeng,
> 
> Thanks again for your contribution.
> 
> On Wed, 2020-08-19 at 09:50 +0800, lixiaokeng wrote:
>>
>> If checking is_deamon is deleted, there are many other things need be
>> done like in
>> https://www.redhat.com/archives/dm-devel/2020-July/msg00245.html. And
>> this
>> branch develops from 0.8.3 but upstream_queue is mainline which
>> develops from
>> 0.8.4.
> 
> This is a misunderstanding. My upstream-queue branch is *not* mainline.
> Mainline is http://git.opensvc.com/multipath-tools/.git. Also, my
> entire patch series (link above) was based on upstream-queue, which in
> turn was based on 0.8.4, not 0.8.3.
> 
> As the name says, "upstream-queue" represents the queue of pending
> patches which have at least one positive review (and no negative ones).
> The intention is 1. to provide an overview for myself and other
> interested parties, and 2. to simplify matters for the actual
> maintainer, Christophe, when he applies patches onto mainline.
> 
> My patch series changes the same code path as this one, and I think it
> solves the same issue, albeit differently. Most of my series has
> meanwhile been positively reviewed by Ben, and the remaining open
> issues are in other parts of the series. I'll hopefully be able to push
> it to upstream-queue soon. IMO it makes little sense to push changes to
> upstream-queue which are going to be removed again when my series is
> applied (I don't intend to start using merge operations in this
> branch).
> 
> Christophe is on the recipients list of your patch. He may of course
> decide to apply your patch before my series, in which case I'll have to
> rebase mine. But he'll probably have other prior patches to look at
> first before he gets down to this one.
> 
> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

