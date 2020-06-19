Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 524642019BE
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 19:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592589049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3EaiZUV3QAJ0rmL6ZfKsQulRe+35BksAngRPi1HdUWU=;
	b=Nf1SkGiQWCHzKX8kzVemAT3mzlYWC+HKDgDZxLUaaP80CSiq/PhYEM+FY4Wu9gCxg/Ds6d
	FT/YfhwR/5RzoJA2G3LRkm6HtrJlYF8pU0duzcAhuU0czVxgkIYBmPPNuq0xNDoaYRamwa
	ceWoXAWtbt/F5s/opViVo7IhXwuFnNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-iIUqwcntMfavQvox3Kdjxg-1; Fri, 19 Jun 2020 13:50:46 -0400
X-MC-Unique: iIUqwcntMfavQvox3Kdjxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F283018585AA;
	Fri, 19 Jun 2020 17:50:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72FA87167B;
	Fri, 19 Jun 2020 17:50:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A043A1809547;
	Fri, 19 Jun 2020 17:50:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JHoZpo007597 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 13:50:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE3732156A2E; Fri, 19 Jun 2020 17:50:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA7312157F23
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 17:50:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE5011859160
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 17:50:33 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-h3iDj-fUPVWLBxxoYUzzPQ-1; Fri, 19 Jun 2020 13:50:31 -0400
X-MC-Unique: h3iDj-fUPVWLBxxoYUzzPQ-1
Received: by mail-wr1-f70.google.com with SMTP id c14so4614292wrm.15
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 10:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z12TGmuPXayZpZVkCUfMX5oAvi29Mz/dbvoL6cdGtPw=;
	b=c0k/pn74gQ0pfZSEi+t2juO+00go1Yf54sig3+IEyft6KZw8AnikpDjWMC90UQN5gQ
	FMbgrQCblQ58QWbZ+qp+goKeOKX+ZlG+RGSz5tt9uhhdCezfmYFsI7d81eK/Fh2ODRZW
	TNW4g2A4evUQfAMQwcOyBR7FFeSRZErUr0942Y0Vs0uyUHORVSD7Y9snto3AaUwlJ8bB
	rFJC2284WeWgVdDzRL4C+rPdXIC1oa6jFCXTk3ulvGet4f6JYVb01Sg0tSDifNhIR6v3
	v19lJGNrACDy7yviXgZs28MKN3OeyBseh1kZ3XJIPT9bn5YZHYd5ZFdnI2g35osZumqx
	LRaA==
X-Gm-Message-State: AOAM531mMgbK7euS5ktEu1XMd8of5U7YOZrTSDZBG+KV1MisUoH3m5+q
	uRFBQqBBvQidCNY+CvjQh/m596ziOOZ5bDhuoxIvEWcBf1kOcPhoUtygFEsJvSuefn4x6Ce9Auz
	Hg7+cZlsa/eNx5eGxp/RizFDNVt8Dpr4=
X-Received: by 2002:adf:9022:: with SMTP id h31mr1764189wrh.181.1592589030452; 
	Fri, 19 Jun 2020 10:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvKaJ3uN3iEKJykQnrLMhKfclBZUvwBDfNPifkk2Ws8loih2fH3Wbw31vqCuk29JA359HkkqaYgiIK2Sx5YVg=
X-Received: by 2002:adf:9022:: with SMTP id h31mr1764168wrh.181.1592589030250; 
	Fri, 19 Jun 2020 10:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200619123803.1441373-1-yangerkun@huawei.com>
	<20200619123803.1441373-5-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-5-yangerkun@huawei.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Jun 2020 13:50:19 -0400
Message-ID: <CAHhmqcTDzJ4aMD5q-s5GfHVg8iNhYmunVUSsba2nPCRdD-G4WA@mail.gmail.com>
To: yangerkun <yangerkun@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: bmr@redhat.com, dm-devel@redhat.com, "Alasdair G. Kergon" <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 4/4] dm dust: introduce listbadblocks in
	the rst
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2020 at 8:37 AM yangerkun <yangerkun@huawei.com> wrote:
>
> Since we support the listbadblocks command, introduce the detail in the
> doc.
>
> Signed-off-by: yangerkun <yangerkun@huawei.com>
> ---
>  .../admin-guide/device-mapper/dm-dust.rst        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
> index 84149c08b68f..5c66a71e3442 100644
> --- a/Documentation/admin-guide/device-mapper/dm-dust.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
> @@ -205,6 +205,21 @@ If there were no bad blocks to clear, the following message will
>  appear::
>
>          no badblocks found
> +Listing the bad block list
> +--------------------------
> +
> +To list all bad blocks in the bad block list(using an example device
> +with blocks 1 and 2 in the bad block list),run the following message
> +command::

There are a couple of missing spaces here, at these two locations:

"...bad block list(using..."
change to
"...bad block list (using..."

and

"...in the bad block list),run the..."
change to
"...in the bad block list), run the..."

> +
> +        $ sudo dmsetup message dust1 0 listbadblocks
> +        1
> +        2
> +
> +No bad block exists, same message will get following report::

This would be better as the following:

"If there are no bad blocks in the bad block list, the following
message will appear"

However, note that we discussed changing this to an empty line,
instead of "null", so we would need to update the documentation to
reflect that the output will be an empty line.


Thanks,

Bryan

> +
> +        $ sudo dmsetup message dust1 0 listbadblocks
> +        null
>
>  Message commands list
>  ---------------------
> @@ -224,6 +239,7 @@ Single argument message commands::
>
>          countbadblocks
>          clearbadblocks
> +        listbadblocks
>          disable
>          enable
>          quiet
> --
> 2.25.4
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

