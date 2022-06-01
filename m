Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59953A8DE
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jun 2022 16:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654092832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RgNzym5BirkjBAaZ3vo0ILlMAyGrCjjrkQy6xqqUGOY=;
	b=DuF0Bjy5Zv1Mw+86B7H7qzOSct9JVYB3CH2Z84755cARG0doGt5HyzvlsRi6Hiwfl92sBD
	waQa1kjAf4ZxzLxHkJgbIO9xOD+YX5X4s9ybWR4GO2mwCIPNLXLaFUdqjvBpvHT4y4YTSi
	2F6+u0SeqjDm1730kqfHE6HvBrgFOVM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-obE2mB8dMbOa46DL5HdD8Q-1; Wed, 01 Jun 2022 10:13:51 -0400
X-MC-Unique: obE2mB8dMbOa46DL5HdD8Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66AB11C13945;
	Wed,  1 Jun 2022 14:13:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEB80492C3B;
	Wed,  1 Jun 2022 14:13:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0AE3719451EC;
	Wed,  1 Jun 2022 14:13:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 711CB194706A
 for <dm-devel@listman.corp.redhat.com>; Wed,  1 Jun 2022 14:13:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5581540CFD0A; Wed,  1 Jun 2022 14:13:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F9CE40CF8EB
 for <dm-devel@redhat.com>; Wed,  1 Jun 2022 14:13:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3245D804198
 for <dm-devel@redhat.com>; Wed,  1 Jun 2022 14:13:39 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-IXs2LHOCPzCyMMl5AORBQQ-1; Wed, 01 Jun 2022 10:13:36 -0400
X-MC-Unique: IXs2LHOCPzCyMMl5AORBQQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 s9-20020ae9f709000000b006a3e88115b7so1348225qkg.20
 for <dm-devel@redhat.com>; Wed, 01 Jun 2022 07:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/6cFmagpZS+hji6WNkFHLta2n7SzyuJJ+i8HVMquW3Y=;
 b=7rRUWo/Bx7MEWqbPOHAqAchLI5OSNfc396Aw/OYVrmIBBkk7hFCaHfeit2MidyBdEY
 ZD6c1N3B856tpOmtMoaKEVDFjzHvbJHzY4bewcv60/lnyW3qG/vN34qSk1y8ZQ8uoqQ2
 8zFeONJmeLmohDvLMHtxQUy0J9QmEXvSk646pQ8RRTzy4tCzIzVjMMYqGoULm/083N5j
 Ac8LAUTe13hUssY4d/yPWhi2Q7SLWv0oj8706ILuRPFuA1oVcWa78Rov0+5iRAwev2cv
 p3k5OYkpOGgteLrnpeQo1r80CDegNVBr5XuJqzN6sZbFuW65L3faOtAtFwFu6LXdxuz9
 4bNg==
X-Gm-Message-State: AOAM533vp8aMHgh4yezfEdgWm5QdnRlxrSgGZHpQznBx9FOr7t9Adfb0
 bI2NMdmD4iicygU8wrJoxdRKijmf1T0mq7UTo9bL3KhEiA559ihcU3XG1mn59wbDng1E0B4foE4
 03itBYGucoU6dnQ==
X-Received: by 2002:a05:622a:14ca:b0:304:c23f:bf48 with SMTP id
 u10-20020a05622a14ca00b00304c23fbf48mr44105qtx.250.1654092816394; 
 Wed, 01 Jun 2022 07:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTtzbPjDv8fpmrGbyUXl2t6UMgh4OaBJ04+ZVxvQBYai7b7j9eAy3BavkBCtobjtfzDJlUqQ==
X-Received: by 2002:a05:622a:14ca:b0:304:c23f:bf48 with SMTP id
 u10-20020a05622a14ca00b00304c23fbf48mr44046qtx.250.1654092815837; 
 Wed, 01 Jun 2022 07:13:35 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52]) by smtp.gmail.com with ESMTPSA id
 l186-20020a3789c3000000b006a37710ef89sm1404072qkd.115.2022.06.01.07.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 07:13:35 -0700 (PDT)
Date: Wed, 1 Jun 2022 10:13:34 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Ypd0DnmjvCoWj+1P@redhat.com>
References: <YpK7m+14A+pZKs5k@casper.infradead.org>
 <2523e5b0-d89c-552e-40a6-6d414418749d@kernel.dk>
 <YpZlOCMept7wFjOw@redhat.com> <YpcBgY9MMgumEjTL@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YpcBgY9MMgumEjTL@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] bioset_exit poison from dm_destroy
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, david@fromorbit.com, Matthew Wilcox <willy@infradead.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 01 2022 at  2:04P -0400,
Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, May 31, 2022 at 02:58:00PM -0400, Mike Snitzer wrote:
> > Yes, we need the above to fix the crash.  Does it also make sense to
> > add this?
> 
> Can we just stop treating bio_sets so sloppily and make the callers
> handle their lifetime properly?  No one should have to use
> bioset_initialized (or double free bio_sets).
> 

Please take the time to look at the code and save your judgement until
you do.  That said, I'm not in love with the complexity of how DM
handles bioset initialization.  But both you and Jens keep taking
shots at DM for doing things wrong without actually looking.

DM uses bioset_init_from_src().  Yet you've both assumed double frees
and such (while not entirely wrong your glossing over the detail that
there is intervening reinitialization of DM's biosets between the
bioset_exit()s)

And it really can just be that the block code had a bug where it
didn't clear bs->cache.  Doesn't need to be cause for attacks.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

