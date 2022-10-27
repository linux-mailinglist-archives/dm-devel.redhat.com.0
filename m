Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54D60F8D6
	for <lists+dm-devel@lfdr.de>; Thu, 27 Oct 2022 15:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666876583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VArkn1lXZnepu4NlvoqKwbv8w1+riMRY9mS6v92rV/c=;
	b=IHeI1ajlWc8fpDx0sqHFLKkDKuCwP0WFKbS6YSpbxSsAy4WJfrWZkXqvD8NK6dIIgS+RIi
	9CBkxXbCVJPHQYsfhTMwavVhnI2VBxa4cVM4wXgT3lZ1Q1md04VJ9u1raIdXC73a8aOtn3
	okmUfGaxHpOZaSs+wAuwblpSE3NxA+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-2HMiCfVlPQioGBO9F4-kzA-1; Thu, 27 Oct 2022 09:16:20 -0400
X-MC-Unique: 2HMiCfVlPQioGBO9F4-kzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AC73185A7A3;
	Thu, 27 Oct 2022 13:16:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31F772024CB7;
	Thu, 27 Oct 2022 13:16:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 73A6A1947066;
	Thu, 27 Oct 2022 13:16:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B1A61946597
 for <dm-devel@listman.corp.redhat.com>; Thu, 27 Oct 2022 13:16:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FEE12024CBB; Thu, 27 Oct 2022 13:16:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 492052024CB7
 for <dm-devel@redhat.com>; Thu, 27 Oct 2022 13:16:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B1B4811E7A
 for <dm-devel@redhat.com>; Thu, 27 Oct 2022 13:16:09 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-yOLwC6aZObicapq7qCyugw-1; Thu, 27 Oct 2022 09:16:06 -0400
X-MC-Unique: yOLwC6aZObicapq7qCyugw-1
Received: by mail-pj1-f41.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso6289230pjz.4
 for <dm-devel@redhat.com>; Thu, 27 Oct 2022 06:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lUXGTDslsfAFx1Eylt2BsWoz/ZloDL/xps+YJzdNYlY=;
 b=Uuo+sFuFATh12RY6VLVY5PyqJ8LmRTBdyjfFJI5JBfYK++lnWlnanWzOtL75QDZUyz
 DCoDK2uIvpfh56OiKMqubFiXiz7aMd+n5NO6yeOKJ45QMHxV6+nMgAEl1OOxaHouJ0M/
 oDgIki20HzasBueWlHYT0VqpuXK9f2EWkbiE14ILDc8othYmaXQzJtUSpBDMHJHC3Orz
 TcvGUJw4yq1gmsm02kF0gsEbOxjKAyzWY3VF8IV1ZWzlaXuX9G7DPMfw4kNnaEdUlHKI
 tnS9w4eQfS0MTZsgF3pwdbXuZ0pSxjLCmp6g45ZWfu3mTLD4ELC7pfjOUtfE+Qvhiiz3
 1ijQ==
X-Gm-Message-State: ACrzQf1hlOVKk9PzMmaRAmlo3+AVGpgD0y2nVlf3hgVhBGQ2ghEUIJOb
 oUGWATU3r1Pj+t7LsE55Yhyi8FSP7wg2YF14
X-Google-Smtp-Source: AMsMyM5BPlA5HVPe6ZOlhjWSe4vnDS/vIpcXIHC2Ni6AyJB7oroOBPJBhdMyzoUGKJBqZ+CrpKLBeQ==
X-Received: by 2002:a17:902:d70a:b0:178:5d52:9e41 with SMTP id
 w10-20020a170902d70a00b001785d529e41mr48242037ply.0.1666876555034; 
 Thu, 27 Oct 2022 06:15:55 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 m10-20020a63f60a000000b004608b721dfesm1027480pgh.38.2022.10.27.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 06:15:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>
In-Reply-To: <20221027085709.513175-1-ming.lei@redhat.com>
References: <20221027085709.513175-1-ming.lei@redhat.com>
Message-Id: <166687655373.10763.598511493848886543.b4-ty@kernel.dk>
Date: Thu, 27 Oct 2022 07:15:53 -0600
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH] blk-mq: don't add non-pt request with
 ->end_io to batch
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 Mike Snitzer <snitzer@kernel.org>, Changhui Zhong <czhong@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 27 Oct 2022 16:57:09 +0800, Ming Lei wrote:
> dm-rq implements ->end_io callback for request issued to underlying queue,
> and it isn't passthrough request.
> 
> Commit ab3e1d3bbab9 ("block: allow end_io based requests in the completion
> batch handling") doesn't clear rq->bio and rq->__data_len for request
> with ->end_io in blk_mq_end_request_batch(), and this way is actually
> dangerous, but so far it is only for nvme passthrough request.
> 
> [...]

Applied, thanks!

[1/1] blk-mq: don't add non-pt request with ->end_io to batch
      (no commit info)

Best regards,
-- 
Jens Axboe


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

