Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 71E87275DA6
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 18:39:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-UuZKrPINO_eSdENxvDbnhQ-1; Wed, 23 Sep 2020 12:39:04 -0400
X-MC-Unique: UuZKrPINO_eSdENxvDbnhQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 249248018A4;
	Wed, 23 Sep 2020 16:38:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 696445D990;
	Wed, 23 Sep 2020 16:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D154183D040;
	Wed, 23 Sep 2020 16:38:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NGcXOZ006942 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 12:38:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E02F42024508; Wed, 23 Sep 2020 16:38:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB9ED20244F7
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 16:38:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F5CE800883
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 16:38:31 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-zoBf2swZOvSNCA7LfNREfg-1; Wed, 23 Sep 2020 12:38:29 -0400
X-MC-Unique: zoBf2swZOvSNCA7LfNREfg-1
Received: by mail-pf1-f195.google.com with SMTP id x22so10553698pfo.12
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 09:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vq5QEJTZb/1RH43/N7JqAL2lDhT92d3iZlvsTjPK+o4=;
	b=Tis0XdVIF5BX7mU0uDMlHX+kOnxIWt7o7xHd6sxo6jgmSaB1rRo6/2IwpJ7SYe5YL1
	JrS7dAYHi/uQjBSteP1Fv8IMf2kVhrsPI5wDXCR+QpbB5FDiqEpKrdU2nR8AvtJbaAJt
	AaICMJ7ChazFWDF9H8bTnHnTiuWhnqY3EGRMu4XDPNtvdDdeH5dIy1J6XO36SGTKeTsc
	XiiYTLMqUQYeNE9FY7WUVKqTGYezYenuPtvVBJ5FTsHoeST0fIMNqoRuq9x4zzr2Aqyr
	bq7aI1Z3L+fOstIGTovGAiVSOVmwCWcXnbvyrzOt00cCXtmJj02ohnmnPRgcGbE+nlim
	2Urw==
X-Gm-Message-State: AOAM532bJSYjOSDxcSWpvrk3WkAK5R18F+3P0F3KhiAmCdQgB5UUABdP
	sKYWkEaZAobYmo88QLbDtQ7gqg==
X-Google-Smtp-Source: ABdhPJzPyvcRrFapP4Pc8Inl/z95tkGtouO+7e2AlRhXiuH9O8dzDK2TbVvj6LfzAtXmHQyrSwJWLQ==
X-Received: by 2002:a62:6044:0:b029:151:1a04:895 with SMTP id
	u65-20020a6260440000b02901511a040895mr721835pfb.34.1600879107970;
	Wed, 23 Sep 2020 09:38:27 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id y6sm120224pjl.9.2020.09.23.09.38.27
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 23 Sep 2020 09:38:27 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200922023251.47712-1-snitzer@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <bc988bfa-5f81-3d04-82e8-489943143355@kernel.dk>
Date: Wed, 23 Sep 2020 10:38:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922023251.47712-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 0/6] dm: fix then improve bio splitting
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/21/20 8:32 PM, Mike Snitzer wrote:
> Hi,
> 
> Patches 1 and 2 are queued for me to send to Linus later this week.
> 
> Patches 3 and 4 are block core and should get picked up for 5.10.
> Jens, please pick them up. I revised the header for patch 4 to give
> better context for use-case where non power-of-2 chunk_sectors
> occurs. Patch 4 enables DM to switch to using blk_max_size_offset() in
> Patch 6.
> 
> Patches 5 and 6 just show how DM will be enhanced for 5.10 once
> patches 3 and 4 land in the block tree.

Applied 3-4 for 5.10, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

