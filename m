Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 100DC72F2A5
	for <lists+dm-devel@lfdr.de>; Wed, 14 Jun 2023 04:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686710642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CHEckl6a5iOpW5n1wgQK8mo/4nx1GYfQNq38iK7Mbsc=;
	b=RZXP7ADh0h/+0N0XiNHrcDtyiWqQ/aj/GAmogYNHd69+u0/dz+KkFhG+L/efdyJ0dv+Kbn
	1Ba2JpYj+jjxwYJCZ1WNllhpfhRqAr6KSdZUMYCHSflUCnPjromdwDKAjwOrMTupgKaDkP
	EFdNJPzM6qWS9h0NxIPWzU8oYj5tI8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-vtrj8rkVPWmLuqqqaaAFQA-1; Tue, 13 Jun 2023 22:44:01 -0400
X-MC-Unique: vtrj8rkVPWmLuqqqaaAFQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D95E6101A52C;
	Wed, 14 Jun 2023 02:43:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF5ED2166B25;
	Wed, 14 Jun 2023 02:43:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94AA119451C4;
	Wed, 14 Jun 2023 02:43:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6A5FE194658C
 for <dm-devel@listman.corp.redhat.com>; Wed, 14 Jun 2023 02:43:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 018A3C1604D; Wed, 14 Jun 2023 02:43:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
 (agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8C72C1603B;
 Wed, 14 Jun 2023 02:43:49 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
 from userid 3883)
 id 499054043A65; Wed, 14 Jun 2023 03:42:28 +0100 (BST)
Date: Wed, 14 Jun 2023 03:42:28 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: baomingtong001@208suo.com
Message-ID: <20230614024228.GA63706@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: baomingtong001@208suo.com, agk <agk@redhat.com>,
 snitzer <snitzer@kernel.org>, dm-devel <dm-devel@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <202306141008237478337@208suo.com>
MIME-Version: 1.0
In-Reply-To: <202306141008237478337@208suo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH] dm: remove unneeded variable
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
Cc: dm-devel <dm-devel@redhat.com>, snitzer <snitzer@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, agk <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 14, 2023 at 10:10:33AM +0800, baomingtong001@208suo.com wrote:
> fix the following coccicheck warning:
> drivers/md/dm-snap-persistent.c:909:14-16: Unneeded variable: "sz".
 
> - unsigned int sz = 0;
 
> - return sz;
> + return 0;
 
Did the patched code compile OK for you?

The semantics of the DMEMIT macro are perhaps a tad unexpected.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

