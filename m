Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEC02779A4
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 21:45:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-C6QI2yBtM-e61YWIhAmXEA-1; Thu, 24 Sep 2020 15:45:27 -0400
X-MC-Unique: C6QI2yBtM-e61YWIhAmXEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 790411017DF5;
	Thu, 24 Sep 2020 19:45:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F6C5C1C7;
	Thu, 24 Sep 2020 19:45:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 292991826D2B;
	Thu, 24 Sep 2020 19:45:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OJj3gI007124 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 15:45:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42C7E112314; Thu, 24 Sep 2020 19:45:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D80D115E0E
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 19:45:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDD2E80351F
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 19:45:00 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-x2owPb6UNVeLpFA2_xNBFA-1; Thu, 24 Sep 2020 15:44:58 -0400
X-MC-Unique: x2owPb6UNVeLpFA2_xNBFA-1
Received: by mail-pf1-f176.google.com with SMTP id b124so397016pfg.13
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 12:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ADwlTn9rnJzlHv/xfLefERCgTh/zOY3+dj+IP5LMhIo=;
	b=lFRMnKOVJKtQUNLJEqxBMwieLZB+AF+ZpG/jkLGvt1VrTfdFuah4qGd3MRFP5CnzVY
	zSe4t3LT7mfGPDZbkchMlgHShKjNJS2wcSTrL1MNis65vuntTGATeEESYLjiXPIHHblr
	OqCG298scErdDrSIYyygCkWpbS0uUhLWpil1Wb9TU0o/o3HyRQOrNa6clQy0F0YKoGGp
	hvkp1IHASdIDRH4IohkJhauRRG5ygUc3buUp3JeX8pGfiXPk19H2p19Fbep5f6EDrRUE
	UhmeDkp10EFNARncD+Z839T4Hu8G1B/ZohXXTdx/et7UHZSMGi24kIsrVszJyQZDUkA/
	GjbA==
X-Gm-Message-State: AOAM530N56XKXsXA6nbW/saCCLBoEqJRVJVj1DfC/mUzy7hgm+Vs/2Ge
	Z+c6FClVjpzd7U7zdQfrDc2Blg==
X-Google-Smtp-Source: ABdhPJyn7jUbiC3AGiO/dBfKmKGpcA3VV/JE4LzjEmCUjGJIbrcL8/kmgANM72e+JonEfnG9EJ77rg==
X-Received: by 2002:a17:902:854b:b029:d1:cbf4:bb43 with SMTP id
	d11-20020a170902854bb02900d1cbf4bb43mr778274plo.13.1600976697336;
	Thu, 24 Sep 2020 12:44:57 -0700 (PDT)
Received: from ?IPv6:2620:10d:c085:21d6::1911? ([2620:10d:c090:400::5:d63d])
	by smtp.gmail.com with ESMTPSA id
	u10sm267612pfn.122.2020.09.24.12.44.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 24 Sep 2020 12:44:56 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200924065140.726436-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a9235ba9-95a0-4251-ee7d-e4012775346e@kernel.dk>
Date: Thu, 24 Sep 2020 13:44:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924065140.726436-1-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	cgroups@vger.kernel.org, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>, drbd-dev@tron.linbit.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] bdi cleanups v7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/24/20 12:51 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series contains a bunch of different BDI cleanups.  The biggest item
> is to isolate block drivers from the BDI in preparation of changing the
> lifetime of the block device BDI in a follow up series.

Applied, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

