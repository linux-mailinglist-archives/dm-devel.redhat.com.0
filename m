Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D4B7E276B93
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:16:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-IeUjz-4pNTevjraiM07lfw-1; Thu, 24 Sep 2020 04:16:16 -0400
X-MC-Unique: IeUjz-4pNTevjraiM07lfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5E108030C7;
	Thu, 24 Sep 2020 08:16:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5917019930;
	Thu, 24 Sep 2020 08:16:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 265EA7A00B;
	Thu, 24 Sep 2020 08:16:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O8FqF7013497 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 04:15:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9130110BBCEB; Thu, 24 Sep 2020 08:15:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C0D510BBCE5
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 08:15:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33238858287
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 08:15:50 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-399-U82FydSSOhiLdDR0qQs3SA-1; Thu, 24 Sep 2020 04:15:47 -0400
X-MC-Unique: U82FydSSOhiLdDR0qQs3SA-1
Received: by mail-wr1-f68.google.com with SMTP id o5so2693101wrn.13;
	Thu, 24 Sep 2020 01:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hz3TcGWO7/AfvihH2KOjRcd8XnvkpJlGEzqbwl68Aes=;
	b=LGog5fguyOwWtqEIK1dcd7tO1bVvuys5mkiINhatxghNnTH1vQN53n39I++iFs2R2D
	96ezzwvA4bBvaSjZO6PQxIaFadxFcXDWhx6p8poZ986262xBwUPjrdbP0V+JS5FnT9+1
	ekzGi0CD7NrZ7El+3NzEH72r+JgUQhY+ag4x7hSHZjWgsmEuKcUJvWUXYaL4A3Jw6I0V
	hd+f2vPfPYoOwIidsxm1UeIc5gPxtEymFE7a5NA8Q3IWxhkqXDsURDwoBEaXwqD+awHJ
	ZeMX3yhp2IFurYs+xUYdJszQZQ48e0avs2twxW2FMqrv+QYwOEJcPXWzBEziEif25gkP
	QcPg==
X-Gm-Message-State: AOAM533M9Pkv37c7shS+pFJTjU8FAftKhRExVSbvjLJkobnUsfLQQo4E
	KvmXVa+pOopUYa9wg3nY8QNYdFFOPCqsi5qb
X-Google-Smtp-Source: ABdhPJzvee1QsfyahATarz8VmFbHz3oqzjb/U2YB+nCT7EkdO2HCs23D4w2Nm/a5gLL5oQiY8gIwaQ==
X-Received: by 2002:adf:f784:: with SMTP id q4mr3686601wrp.126.1600935345258; 
	Thu, 24 Sep 2020 01:15:45 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	m18sm2450322wmg.32.2020.09.24.01.15.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 24 Sep 2020 01:15:44 -0700 (PDT)
To: Eric Biggers <ebiggers@kernel.org>, Mike Snitzer <snitzer@redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <1c44946e-9661-16f7-1c38-32d666b55fb2@gmail.com>
Date: Thu, 24 Sep 2020 10:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924051419.GA16103@sol.localdomain>
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
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Martin Petersen <martin.petersen@oracle.com>, dm-crypt@saout.de,
	Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>,
	dm-devel@redhat.com, Shirley Ma <shirley.ma@oracle.com>,
	mpatocka@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
 lengths for skcipher devices
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 24/09/2020 07:14, Eric Biggers wrote:
> On Wed, Sep 23, 2020 at 09:27:32PM -0400, Mike Snitzer wrote:
>> You've clearly done a nice job with these changes.  Looks clean.
>>
>> BUT, I'm struggling to just accept that dm-crypt needs to go to these
>> extra lengths purely because of one bad apple usecase.
>>
>> These alignment constraints aren't new.  Are there other portions of
>> Linux's crypto subsystem that needed comparable fixes in order to work
>> with Microsfot OS initiated IO through a guest?
>>
>> You forecast that these same kinds of changes are needed for AEAD and
>> dm-integrity... that's alarming.
>>
>> Are we _certain_ there is no other way forward?
>> (Sorry I don't have suggestions.. I'm in "fact finding mode" ;)
>>
> 
> I don't understand why this is needed, since dm-crypt already sets its
> logical_block_size to its crypto sector_size.  Isn't it expected that I/O that
> isn't aligned to logical_block_size fails?  It's the I/O submitter's
> responsibility to ensure logical_block_size alignment of all I/O segments.
> Exactly how is the misaligned I/O actually being submitted here?

Thanks for mentioning it - exactly that I asked when reading this patch...
It seems that we are here fixing a problem that is just caused when someone
ignores clearly set restrictions.

Who is submitting these bioses? Why can it not be fixed there?

What happens with writes to fs journals, etc., is it still safe if we are
processing such unaligned bios?

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

