Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6D70088D
	for <lists+dm-devel@lfdr.de>; Fri, 12 May 2023 15:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683896475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cvnd/eREKqP0pJSSIkvmpvhinEv236+C+MShJzSgC18=;
	b=BwpqFChU61XPGy+H76t2BZaRe5vqyLRawV4H3p4DXOmRk96avhplxHALYbMD/+Zed2Ezi0
	uqmRjSwzO1oCimElxrBrdyURx/nhqerOukq4NMQDJ6rE0xjoixCy2rDjb+nG1A+h/vwJVG
	/YUiQY50xTMOevy40OhJxPyJhWY5bsU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-15OF8adLPD-jlNdKGxo2vg-1; Fri, 12 May 2023 09:01:13 -0400
X-MC-Unique: 15OF8adLPD-jlNdKGxo2vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52A308533DC;
	Fri, 12 May 2023 13:01:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A79D814171B6;
	Fri, 12 May 2023 13:00:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71AB319451EB;
	Fri, 12 May 2023 13:00:54 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5929D19451E3
 for <dm-devel@listman.corp.redhat.com>; Fri, 12 May 2023 13:00:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2D0891121315; Fri, 12 May 2023 13:00:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25ACD1121314
 for <dm-devel@redhat.com>; Fri, 12 May 2023 13:00:53 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E80880067D
 for <dm-devel@redhat.com>; Fri, 12 May 2023 13:00:53 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-gU2ai_pIP9u8w-wbNR-N2w-1; Fri, 12 May 2023 09:00:49 -0400
X-MC-Unique: gU2ai_pIP9u8w-wbNR-N2w-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4B6AC68B05; Fri, 12 May 2023 15:00:43 +0200 (CEST)
Date: Fri, 12 May 2023 15:00:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <kch@nvidia.com>
Message-ID: <20230512130042.GA29078@lst.de>
References: <20230512080757.387523-1-kch@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230512080757.387523-1-kch@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [RFC PATCH] block: add meaningful macro for flush op
 flags
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
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org, sagi@grimberg.me,
 linux-scsi@vger.kernel.org, snitzer@kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, colyli@suse.de, linux-block@vger.kernel.org,
 song@kernel.org, linux-bcache@vger.kernel.org, target-devel@vger.kernel.org,
 martin.petersen@oracle.com, hch@lst.de, kent.overstreet@gmail.com,
 agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hell no.  This is just obsfucation.  We can look into actually exposing
REQ_OP_FLUSH at the bio level, but not something like this.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

