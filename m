Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFC7347990
	for <lists+dm-devel@lfdr.de>; Wed, 24 Mar 2021 14:27:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-_R78UAW_NG6vNCKuP4i2hg-1; Wed, 24 Mar 2021 09:27:40 -0400
X-MC-Unique: _R78UAW_NG6vNCKuP4i2hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC638EDBEF;
	Wed, 24 Mar 2021 13:22:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1EE95C3E9;
	Wed, 24 Mar 2021 13:22:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 509F84BB7C;
	Wed, 24 Mar 2021 13:22:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12ODLxZZ013139 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 09:21:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9591F2026D6B; Wed, 24 Mar 2021 13:21:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1A82026D13
	for <dm-devel@redhat.com>; Wed, 24 Mar 2021 13:21:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3465100DE7B
	for <dm-devel@redhat.com>; Wed, 24 Mar 2021 13:21:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-371-zsVxiaVlNKWWTvgmrUMQtw-1;
	Wed, 24 Mar 2021 09:21:50 -0400
X-MC-Unique: zsVxiaVlNKWWTvgmrUMQtw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A69BEAD9F;
	Wed, 24 Mar 2021 13:21:48 +0000 (UTC)
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20210324121927.362525-1-ming.lei@redhat.com>
	<20210324121927.362525-3-ming.lei@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <5c3e5bdf-e591-c7c3-1f4d-cf89de5656be@suse.de>
Date: Wed, 24 Mar 2021 14:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324121927.362525-3-ming.lei@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12ODLxZZ013139
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH V3 02/13] block: add one helper to free
	io_context
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMy8yNC8yMSAxOjE5IFBNLCBNaW5nIExlaSB3cm90ZToKPiBQcmVwYXJlIGZvciBwdXR0aW5n
IGJpbyBwb2xsIHF1ZXVlIGludG8gaW9fY29udGV4dCwgc28gYWRkIG9uZSBoZWxwZXIKPiBmb3Ig
ZnJlZSBpb19jb250ZXh0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pbmcgTGVpIDxtaW5nLmxlaUBy
ZWRoYXQuY29tPgo+IC0tLQo+ICAgYmxvY2svYmxrLWlvYy5jIHwgMTEgKysrKysrKystLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gClJldmll
d2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwot
LSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNo
aXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3
NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6
IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0t
ZGV2ZWw=

