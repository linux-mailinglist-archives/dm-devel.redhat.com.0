Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 657BF283CC6
	for <lists+dm-devel@lfdr.de>; Mon,  5 Oct 2020 18:48:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Sbt3zgCOMtyKB77wAefhXg-1; Mon, 05 Oct 2020 12:48:45 -0400
X-MC-Unique: Sbt3zgCOMtyKB77wAefhXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EBC9801FDA;
	Mon,  5 Oct 2020 16:48:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49C911002EEC;
	Mon,  5 Oct 2020 16:48:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4192D1826D2E;
	Mon,  5 Oct 2020 16:48:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095GmM3c008399 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 12:48:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D90232166B28; Mon,  5 Oct 2020 16:48:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C0E2166BA0
	for <dm-devel@redhat.com>; Mon,  5 Oct 2020 16:48:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2A0185828E
	for <dm-devel@redhat.com>; Mon,  5 Oct 2020 16:48:20 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-192-EKxufCeuMleH1oNlK9j9hg-1; Mon, 05 Oct 2020 12:48:18 -0400
X-MC-Unique: EKxufCeuMleH1oNlK9j9hg-1
Received: by mail-io1-f65.google.com with SMTP id y20so9826242iod.5
	for <dm-devel@redhat.com>; Mon, 05 Oct 2020 09:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+JrT5f4ODECOY6SLMg6ZmVv5vw3hnZeQHmUKznSjjA8=;
	b=dc9Lj7jPzAS8+7BJKKxDO/mN65QygWjvWX7ZzhuZyqerHK7LHNrA/YsBCdbhYlU3P5
	ZrLX9rFwYNaBGYf0DIqkpz7g1njPIVE74DYCMm0JTv3hkVR3sp/lnVELl2/w/0u/nGlc
	dHGTU3ia7XTDZGaE7i0IA/j1U8esUWqob6hFeBWD/GM9tW9hpBnl8ZU4WyvwJPsFmTu2
	am19JhKVEeD1C0Vw4gllw2yTwoQI/wLsAszxlHr3IkzqSm+T3RN1pt9dbPa/miXup20F
	MZHXbbbO930rcytTbnWP27IMa+S5SIRpfI/8Zg1B2qUV7f/Gjh9DxOBc/uZw7SSPUtDy
	m2Kw==
X-Gm-Message-State: AOAM532Nn1YVQFOkvPNOb1tvNjNPLWP17JPa0hJe9xiYGOcN7c5gZJsU
	bFCC6cil9ESvGr4cjh5IkNvqg/5mxah4qw==
X-Google-Smtp-Source: ABdhPJzloX6QJEEcEQVQh8m+fFPWalOjPXRzbAMgwJTGWE8+oGR3GAtbw5onccd1LTQlSaWTLbmFXA==
X-Received: by 2002:a05:6602:2d90:: with SMTP id
	k16mr378592iow.19.1601916497737; 
	Mon, 05 Oct 2020 09:48:17 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id s10sm178133ilh.33.2020.10.05.09.48.17
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 05 Oct 2020 09:48:17 -0700 (PDT)
To: Eric Biggers <ebiggers@kernel.org>, linux-block@vger.kernel.org
References: <20200916035315.34046-1-ebiggers@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b84faa9c-f5e7-8c90-d54b-6a1dbf68a35b@kernel.dk>
Date: Mon, 5 Oct 2020 10:48:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916035315.34046-1-ebiggers@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Miaohe Lin <linmiaohe@huawei.com>, dm-devel@redhat.com,
	Satya Tangirala <satyat@google.com>
Subject: Re: [dm-devel] [PATCH v2 0/3] block: fix up bio_crypt_ctx allocation
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/15/20 9:53 PM, Eric Biggers wrote:
> This series makes allocation of encryption contexts either able to fail,
> or explicitly require __GFP_DIRECT_RECLAIM (via WARN_ON_ONCE).
> 
> This applies to linux-block/for-next.
> 
> Changed since v1 (https://lkml.kernel.org/r/20200902051511.79821-1-ebiggers@kernel.org):
>     - Added patches 2 and 3.
>     - Added kerneldoc for bio_crypt_clone().
>     - Adjusted commit message.

Applied for 5.10, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

