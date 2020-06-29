Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D581520CF73
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 17:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593443433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OkuzWxq5MPKibfDkbF8UgIAp5Drw48bilMejAITGG8s=;
	b=angrmcsRVEQbAc0ziemMpOb46Rq5GIZ2gjlyww2YE765Pl3aNm7ffYyjTmy3rEwNa9hPPI
	ty6g/h6/r4YXFbV170k9uAiCllGDpgfoFQOdj+wgn9dHWMX9VW51Ka5Ra3u5jKC89lN9l8
	ggV5SzNq8JwSaQ5A3COhNmDcYb638wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-MZ3CNsZgNMScxjeR3trghA-1; Mon, 29 Jun 2020 11:10:31 -0400
X-MC-Unique: MZ3CNsZgNMScxjeR3trghA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1900210059B3;
	Mon, 29 Jun 2020 15:10:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A016F5C1B2;
	Mon, 29 Jun 2020 15:10:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23B7087893;
	Mon, 29 Jun 2020 15:10:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TF9uxK022377 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 11:09:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21E5A951A7; Mon, 29 Jun 2020 15:09:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CCDC8057F
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 15:09:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E748E8007D9
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 15:09:53 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-CpZQB7sFNr2RZna5AhpjxA-1; Mon, 29 Jun 2020 11:09:50 -0400
X-MC-Unique: CpZQB7sFNr2RZna5AhpjxA-1
Received: by mail-pj1-f42.google.com with SMTP id b92so8147156pjc.4
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NqlmVG78iXs3ajjXsqe/luI6Bsp4Jqxp96Da7CCW4P0=;
	b=AREpU7Cp6mw1Se0VrVvG9ybLyVUvcfnLIqo0rfc6PbkadiP21OyLlNzmJLKKsu7r+0
	Kac9F1YxpLSzCBKjEfWLh9Wus5h7pgVA9iExUsPuKHuqXimzA/+Rm2R3RLb5eBLiSGGh
	AjNR+UmBp1EqoSavSlAL+CU5oixsQrGeaFBJFMpKp6MmjDrxTtD2za7y0S7tqs06lfPe
	TAop20kGGL46/kyGExeU9Oj1osOl55hJM7AN8sS5J3fzLu7iQ1emDkZbrhOk15L3c6MW
	xWDc1XkuWMN/xKRN1nM3crZKogcz36yeBpXKWPPoQ85FP4G2WXCO8gu3ZcMOnZB8NeW8
	BQkg==
X-Gm-Message-State: AOAM5324077GGwYI9XDwvG21EMWvXjF1rlYwA/m/l8fo/9/oSSfDVrNw
	3v+kBMgyt4lSlEh6vYWSke7M8Q==
X-Google-Smtp-Source: ABdhPJxwZjsguM484F6sMiKLUZjrGQV40HFdBT3LN52GuV2BrrlgN4LhTVhem+onWXtopEtTIEUvTw==
X-Received: by 2002:a17:90a:222d:: with SMTP id
	c42mr11700791pje.126.1593443389436; 
	Mon, 29 Jun 2020 08:09:49 -0700 (PDT)
Received: from [192.168.86.197] (cpe-75-85-219-51.dc.res.rr.com.
	[75.85.219.51])
	by smtp.gmail.com with ESMTPSA id p19sm83847pff.116.2020.06.29.08.09.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 29 Jun 2020 08:09:48 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Tejun Heo <tj@kernel.org>
References: <20200627073159.2447325-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <90c404ed-58b0-274e-516f-b7c63ce34fcc@kernel.dk>
Date: Mon, 29 Jun 2020 09:09:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200627073159.2447325-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] drive-by blk-cgroup cleanups
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/27/20 1:31 AM, Christoph Hellwig wrote:
> Hi all,
> 
> while looking into another "project" I ended up wading through the
> blkcq code for research and found a bunch of lose ends.  So here is
> a bunch of drive-by cleanups for the code.

Applied, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

