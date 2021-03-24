Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B640734799F
	for <lists+dm-devel@lfdr.de>; Wed, 24 Mar 2021 14:31:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-_bK8nRydMoGTtodvduYxMQ-1; Wed, 24 Mar 2021 09:31:07 -0400
X-MC-Unique: _bK8nRydMoGTtodvduYxMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48BB592121A;
	Wed, 24 Mar 2021 13:26:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6BE71282;
	Wed, 24 Mar 2021 13:26:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C29A1809C83;
	Wed, 24 Mar 2021 13:26:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12ODQhbp013693 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 09:26:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E16162026D60; Wed, 24 Mar 2021 13:26:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCB542026D65
	for <dm-devel@redhat.com>; Wed, 24 Mar 2021 13:26:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B31D1819449
	for <dm-devel@redhat.com>; Wed, 24 Mar 2021 13:26:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-368-hE_vpkjTMN2_WGZtUruePQ-1;
	Wed, 24 Mar 2021 09:26:36 -0400
X-MC-Unique: hE_vpkjTMN2_WGZtUruePQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 67F1CAD71;
	Wed, 24 Mar 2021 13:26:35 +0000 (UTC)
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20210324121927.362525-1-ming.lei@redhat.com>
	<20210324121927.362525-5-ming.lei@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <8ce78ece-edc8-c6e4-e641-0ddc8b39b61b@suse.de>
Date: Wed, 24 Mar 2021 14:26:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324121927.362525-5-ming.lei@redhat.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12ODQhbp013693
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH V3 04/13] block: create io poll context for
 submission and poll task
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMy8yNC8yMSAxOjE5IFBNLCBNaW5nIExlaSB3cm90ZToKPiBDcmVhdGUgcGVyLXRhc2sgaW8g
cG9sbCBjb250ZXh0IGZvciBib3RoIElPIHN1Ym1pc3Npb24gYW5kIHBvbGwgdGFzawo+IGlmIHRo
ZSBxdWV1ZSBpcyBiaW8gYmFzZWQgYW5kIHN1cHBvcnRzIHBvbGxpbmcuCj4gCj4gVGhpcyBpbyBw
b2xsaW5nIGNvbnRleHQgaW5jbHVkZXMgdHdvIHF1ZXVlczoKPiAKPiAxKSBzdWJtaXNzaW9uIHF1
ZXVlKHNxKSBmb3Igc3RvcmluZyBISVBSSSBiaW8sIHdyaXR0ZW4gYnkgc3VibWlzc2lvbiB0YXNr
Cj4gICAgIGFuZCByZWFkIGJ5IHBvbGwgdGFzay4KPiAyKSBwb2xsaW5nIHF1ZXVlKHBxKSBmb3Ig
aG9sZGluZyBkYXRhIG1vdmVkIGZyb20gc3EsIG9ubHkgdXNlZCBpbiBwb2xsCj4gICAgIGNvbnRl
eHQgZm9yIHJ1bm5pbmcgYmlvIHBvbGxpbmcuCj4gCj4gRm9sbG93aW5nIHBhdGNoZXMgd2lsbCBz
dXBwb3J0IGJpbyBiYXNlZCBpbyBwb2xsaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pbmcgTGVp
IDxtaW5nLmxlaUByZWRoYXQuY29tPgo+IC0tLQo+ICAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAg
ICB8IDcxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAgYmxvY2sv
YmxrLWlvYy5jICAgICAgICAgICB8ICAxICsKPiAgIGJsb2NrL2Jsay1tcS5jICAgICAgICAgICAg
fCAxNCArKysrKysrKwo+ICAgYmxvY2svYmxrLmggICAgICAgICAgICAgICB8IDQ1ICsrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgIGluY2x1ZGUvbGludXgvaW9jb250ZXh0LmggfCAgMiArKwo+
ICAgNSBmaWxlcyBjaGFuZ2VkLCAxMjEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4g
ClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhh
bm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFn
ZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5
IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bD
vGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vZG0tZGV2ZWw=

