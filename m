Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id E204818C78D
	for <lists+dm-devel@lfdr.de>; Fri, 20 Mar 2020 07:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584686164;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NZGRqwUs5uxfDHeQFuamD6kemDXUfyUJTzYn5AUGQa4=;
	b=YPrfan/1D9I8R2YTz1yPnqBEzbzh9Dkx9usbjSoJ252Vi/fmLhPrD5926UUdCYa5ydIbDu
	pCBpBCVxx0SOqZs+E6F0eI5TZKAjCA0ZGQsg5AmZbxBvuRt5xhZAtMvCts3/FtUgeHIgPP
	QCJBxO2tRo7cQC9JZzWlzpWbMjGklJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-_NDPRxeoP3y9FaTiXXk_QQ-1; Fri, 20 Mar 2020 02:36:02 -0400
X-MC-Unique: _NDPRxeoP3y9FaTiXXk_QQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B99E107ACC9;
	Fri, 20 Mar 2020 06:35:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42BFE912B1;
	Fri, 20 Mar 2020 06:35:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8D1694299;
	Fri, 20 Mar 2020 06:35:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02JAhBME031207 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Mar 2020 06:43:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4ECB02166B30; Thu, 19 Mar 2020 10:43:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AD012166B29
	for <dm-devel@redhat.com>; Thu, 19 Mar 2020 10:43:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F48E8CC925
	for <dm-devel@redhat.com>; Thu, 19 Mar 2020 10:43:09 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-173-xqwt2Zc1PzC6cDvM63i4PA-1;
	Thu, 19 Mar 2020 06:43:06 -0400
X-MC-Unique: xqwt2Zc1PzC6cDvM63i4PA-1
Received: from [192.168.15.99] by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1jEscu-0005aV-EY; Thu, 19 Mar 2020 13:42:12 +0300
To: Christoph Hellwig <hch@infradead.org>, martin.petersen@oracle.com
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
	<20200319102819.GA26418@infradead.org>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <dda7926e-7f2c-61b7-9173-845377cf1229@virtuozzo.com>
Date: Thu, 19 Mar 2020 13:42:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319102819.GA26418@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02JAhBME031207
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 20 Mar 2020 02:35:05 -0400
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, darrick.wong@oracle.com, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com, sagi@grimberg.me,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v7 0/6] block: Introduce REQ_ALLOCATE flag
 for REQ_OP_WRITE_ZEROES
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

On 19.03.2020 13:28, Christoph Hellwig wrote:
> On Fri, Mar 13, 2020 at 04:08:58PM +0300, Kirill Tkhai wrote:
>> I just don't understand the reason nothing happens :(
>> I see newly-sent patches comes fast into block tree.
>> But there is only silence... I grepped over Documentation,
>> and there is no special rules about block tree. So,
>> it looks like standard rules should be applyable.
>>
>> Some comments? Some requests for reworking? Some personal reasons to ignore my patches?
> 
> I'm still completely opposed to the magic overloading using a flag.
> That is just a bad design waiting for trouble to happen.

This flag is suggested by Martin Petersen, while the first version of the patchset was based
on a separate operation.

Since I see only Jens in MAINTAINERS:

BLOCK LAYER
M:      Jens Axboe <axboe@kernel.dk>
L:      linux-block@vger.kernel.org
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
S:      Maintained
F:      block/
F:      drivers/block/
F:      kernel/trace/blktrace.c
F:      lib/sbitmap.c

I expect his comments about final design of this, because both you and Martin are maintainers
of another subsystems. I don't want rework this many times until Jens says he wants some third
design.

I think I'm pretty polite and patient in my waiting, while Jens completely ignores me by some
reasons, which are completely unclear for me. I don't think this is completely polite in relation
to me.

Kirill


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

