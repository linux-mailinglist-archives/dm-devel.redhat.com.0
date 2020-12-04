Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 136E12CEC83
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 11:53:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-CGjTCdsWOr-8CbT1INsS0w-1; Fri, 04 Dec 2020 05:53:22 -0500
X-MC-Unique: CGjTCdsWOr-8CbT1INsS0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A60BD107AD26;
	Fri,  4 Dec 2020 10:53:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8B510016FB;
	Fri,  4 Dec 2020 10:53:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1E9F4BB7B;
	Fri,  4 Dec 2020 10:53:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4Apsqm000807 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 05:51:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7259CF3D36; Fri,  4 Dec 2020 10:51:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0EDF3D3D
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 10:51:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C8F8186E121
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 10:51:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-35-OWWUUohbMROJ9fWUE506Zw-1; Fri, 04 Dec 2020 05:51:48 -0500
X-MC-Unique: OWWUUohbMROJ9fWUE506Zw-1
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1kl8PA-000230-Ol; Fri, 04 Dec 2020 10:33:36 +0000
Date: Fri, 4 Dec 2020 10:33:36 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <20201204103336.GA7374@infradead.org>
References: <20201203215859.2719888-1-palmer@dabbelt.com>
MIME-Version: 1.0
In-Reply-To: <20201203215859.2719888-1-palmer@dabbelt.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, corbet@lwn.net, kernel-team@android.com,
	Palmer Dabbelt <palmerdabbelt@google.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, song@kernel.org, dm-devel@redhat.com,
	linux-kselftest@vger.kernel.org, shuah@kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v1 0/5] dm: dm-user: New target that proxies
 BIOs to userspace
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

What is the advantage over simply using nbd?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

