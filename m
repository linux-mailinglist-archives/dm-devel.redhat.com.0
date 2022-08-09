Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2258E01F
	for <lists+dm-devel@lfdr.de>; Tue,  9 Aug 2022 21:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660072996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CkFQSdz4IZ4A0Wzsc4LW6VfL32w/fqYntrjuZgwxkPQ=;
	b=a1rAohRpzLsejui4xqIT+DLn13UXi+vZsPLevrWWAvaVR8nROSE2pF3htGnC6bMcclSOOY
	SgZKophODhrF2sy7/6cna3JznEZXZTiaoZtQ6DIOiHR/pn5RAgy+jBMREPm0TtIexjh+zS
	iMQ0zjF739qaEkR7TbgDJbvKhD5JF+M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-eo4uZ1BhPRi9qyoHaz9kwg-1; Tue, 09 Aug 2022 15:23:15 -0400
X-MC-Unique: eo4uZ1BhPRi9qyoHaz9kwg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1B2A8001EA;
	Tue,  9 Aug 2022 19:23:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 260D8492C3B;
	Tue,  9 Aug 2022 19:23:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 280001946A5D;
	Tue,  9 Aug 2022 19:23:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 898B11946A41
 for <dm-devel@listman.corp.redhat.com>; Tue,  9 Aug 2022 19:23:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 400692026D64; Tue,  9 Aug 2022 19:23:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C4FB2026D4C
 for <dm-devel@redhat.com>; Tue,  9 Aug 2022 19:23:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08A1F811E81
 for <dm-devel@redhat.com>; Tue,  9 Aug 2022 19:23:07 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-gKK2Zv1dPxeVofH3LQhllg-1; Tue, 09 Aug 2022 15:23:03 -0400
X-MC-Unique: gKK2Zv1dPxeVofH3LQhllg-1
Received: by mail-pj1-f53.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so13165217pjk.1
 for <dm-devel@redhat.com>; Tue, 09 Aug 2022 12:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=GB5/gpb1OgcApv3VLaq+R+qJBjIrW8t5fst4dgp4M/I=;
 b=WtLtL/4Ajc6nhecfkgrq27D8Itn8pkCEUTrCLKDXvNyUuo/gtyqWFW4lBPaq2fOSUx
 d8gcGq5EOewC0l8mgUIa7ulZLehFfM0yqdodl/bEJdxUjqizGPuxL355oZg/fvv0VFxw
 29uXwHRIp9fFm6db1/AbkNNSGA0FbvC48tVnuYSlX01gcz8y2t3Ku9nCG8prwj1OzrCg
 V3FqklCiT39Q4qaHc3EBw1zgEci8VRO+HiNkVKuA8S0IojjmJXvyK/Kx6kLLgbvQSeYX
 ENEPYaPmp3spHWmT2RMeYf2bJP8UhJ/3q4NDgT4VB5bnSxOXzRpoyrgUgoBYoxHKn5U0
 WTQA==
X-Gm-Message-State: ACgBeo1Mk7+RLYv1FI7Xib74/iINbhbe5hZlSNBQ3j+FJwJezkR7Fiju
 c4Wzwwlp7Bjl7sWcQJmgahQ=
X-Google-Smtp-Source: AA6agR6wXr3LrU89unpnzRfKNnDFJjzXPc1yphMgotIaMLByFlUYhvhPY4knSiM+7DE0jLsYRY8xmQ==
X-Received: by 2002:a17:903:447:b0:16e:cbe3:29de with SMTP id
 iw7-20020a170903044700b0016ecbe329demr24670117plb.65.1660072982212; 
 Tue, 09 Aug 2022 12:23:02 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:61e9:2f41:c2d4:73d?
 ([2620:15c:211:201:61e9:2f41:c2d4:73d])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a170902c95100b0016fa99912d7sm9213472pla.141.2022.08.09.12.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 12:23:01 -0700 (PDT)
Message-ID: <5cf33826-7dc7-7af4-c3f3-b4631b78c93b@acm.org>
Date: Tue, 9 Aug 2022 12:22:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Mike Christie <michael.christie@oracle.com>, linux-block@vger.kernel.org, 
 dm-devel@redhat.com, snitzer@kernel.org, axboe@kernel.dk, hch@lst.de,
 linux-nvme@lists.infradead.org, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, james.bottomley@hansenpartnership.com
References: <20220809000419.10674-1-michael.christie@oracle.com>
 <20220809000419.10674-3-michael.christie@oracle.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220809000419.10674-3-michael.christie@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH v2 02/20] scsi: Rename sd_pr_command.
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
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 8/8/22 17:04, Mike Christie wrote:
> Rename sd_pr_command to sd_pr_out_command to match a
> sd_pr_in_command helper added in the next patches.

No trailing dots at the end of the patch subject please (this patch and 
other patches). Otherwise this patch looks good to me.

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

