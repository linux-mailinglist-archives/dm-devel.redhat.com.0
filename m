Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D02951659D6
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189646;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fmiji2pOUCAhRxPxihLyy8OZq7CRVT0ZDEortSqXRlA=;
	b=G7IszSXUE1q/385KengxFz7FgCBLTuJSbEdtJ70l0BQNW2eEYuep2vmTjJu3k1+ElWoN+q
	QMldcpuCwnYjrJBwuDEvm15MizHeB9HAVJlshbiQWTkfDqPUVziZDj3VwSo/4/hq7E5fSj
	I1l9ziPHZJ4TI5rZskhXyp/I553BiIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-Q6D9sn2eOeeiHwj9tHpZTw-1; Thu, 20 Feb 2020 04:06:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE60D101FC6C;
	Thu, 20 Feb 2020 09:06:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC895DA81;
	Thu, 20 Feb 2020 09:06:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9A6118034EF;
	Thu, 20 Feb 2020 09:06:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DGJVmL017325 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 11:19:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 38A5B11D2AE; Thu, 13 Feb 2020 16:19:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 346FB11D2AD
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 16:19:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26F4B802A4C
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 16:19:29 +0000 (UTC)
Received: from os.inf.tu-dresden.de (os.inf.tu-dresden.de [141.76.48.99])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-346--ftvScCwMS2UuT3ubnuolw-1; Thu, 13 Feb 2020 11:19:25 -0500
Received: from [2002:8d4c:3001:48::120:84] by os.inf.tu-dresden.de with esmtpsa
	(TLS1.3:TLS_AES_128_GCM_SHA256:128) (Exim 4.93.0.3)
	id 1j2HCw-0004Br-Lm; Thu, 13 Feb 2020 17:19:18 +0100
To: Mike Snitzer <snitzer@redhat.com>
References: <20200213141823.2174236-1-mplaneta@os.inf.tu-dresden.de>
	<20200213153645.GA11313@redhat.com>
From: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
Message-ID: <82715589-8b59-5cfd-a32f-1e57871327fe@os.inf.tu-dresden.de>
Date: Thu, 13 Feb 2020 17:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200213153645.GA11313@redhat.com>
Content-Language: en-US
X-MC-Unique: -ftvScCwMS2UuT3ubnuolw-1
X-MC-Unique: Q6D9sn2eOeeiHwj9tHpZTw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DGJVmL017325
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 13/02/2020 16:36, Mike Snitzer wrote:
> On Thu, Feb 13 2020 at  9:18am -0500,
> Maksym Planeta <mplaneta@os.inf.tu-dresden.de> wrote:
> 
>> The documentation [1] says that WQ_CPU_INTENSIVE is "meaningless" for
>> unbound wq. I remove this flag from places where unbound queue is
>> allocated. This is supposed to improve code readability.
>>
>> 1. https://www.kernel.org/doc/html/latest/core-api/workqueue.html#flags
>>
>> Signed-off-by: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
> 
> What the Documentation says aside, have you cross referenced with the
> code?  And/or have you done benchmarks to verify no changes?
> 

It seems so from the code. Although, I'm not 100% confident. I did not 
run benchmarks, instead I relied that on the assumption that 
documentation is correct.

> Thanks,
> Mike
> 

-- 
Regards,
Maksym Planeta


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

