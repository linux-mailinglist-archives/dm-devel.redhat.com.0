Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 748BD1D70E3
	for <lists+dm-devel@lfdr.de>; Mon, 18 May 2020 08:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589783171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z+0zTjhEOR2aB2phr1EI8cWbB4hhQmM+5wDKzP+dzoI=;
	b=UrmAv2B576SpF/cFW1KclOcNYeEvaN+CFjoiOeL+5zzeF4Q4i7eEHAfTjjQCn+WcBbW785
	TBPSOqDQ+7FwZQ1L9EXTBxs3rlGKpJiw3QssK8qfCKxXFsiQ/KfJ2DEO2g8hdyNiYEUaeM
	hnXvHq1ysoGBZbL9P4kjE5mL3CK9gsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-y4tyJpsBPAeeDcJ-jPIwsA-1; Mon, 18 May 2020 02:26:09 -0400
X-MC-Unique: y4tyJpsBPAeeDcJ-jPIwsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9009872FE0;
	Mon, 18 May 2020 06:26:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EB2146;
	Mon, 18 May 2020 06:25:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 712664ED62;
	Mon, 18 May 2020 06:25:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04I6POYV018070 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 02:25:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DB1D112C26D; Mon, 18 May 2020 06:25:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 596EC112C242
	for <dm-devel@redhat.com>; Mon, 18 May 2020 06:25:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B12DA18A6661
	for <dm-devel@redhat.com>; Mon, 18 May 2020 06:25:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-340-SfVm1voAOjC3ShABasEOjw-1;
	Mon, 18 May 2020 02:25:16 -0400
X-MC-Unique: SfVm1voAOjC3ShABasEOjw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 33E34AC49;
	Mon, 18 May 2020 06:25:17 +0000 (UTC)
To: =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
References: <367320.1589627953@turing-police>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <7bb0d1c8-b164-d5f3-0218-5c71047c3a8c@suse.de>
Date: Mon, 18 May 2020 08:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <367320.1589627953@turing-police>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04I6POYV018070
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] next-20200514 - build issue in
	drivers/md/dm-zoned-target.c
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xNi8yMCAxOjE5IFBNLCBWYWxkaXMgS2zEk3RuaWVrcyB3cm90ZToKPiBBbSBzZWVpbmcg
YSBidWlsZCBlcnJvciBpbiBuZXh0LTA1MTQuICAtMDQyMCBidWlsdCBPSy4KPiBidWlsZGluZyBh
ICdtYWtlIGFsbG1vZGNvbmZpZycgb24gYSBSUGk0IGluIDMyLWJpdCBtb2RlLgo+IAo+ICAgIE1P
RFBPU1QgNzU3NSBtb2R1bGVzCj4gRVJST1I6IG1vZHBvc3Q6ICJfX2FlYWJpX3VsZGl2bW9kIiBb
ZHJpdmVycy9tZC9kbS16b25lZC5rb10gdW5kZWZpbmVkIQo+IAo+IG9iamR1bXAgYW5kICdtYWtl
IGRyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LnMnIHRlbGxzCj4gbWUgdGhhdCB0aGUgcHJvYmxl
bSBpcyBpbiBmdW5jdGlvbiBkbXpfZml4dXBfZGV2aWNlcygpLCBuZWFyIGhlcmU6Cj4gCj4gQCBk
cml2ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5jOjgwNjogICAgICAgICAgICAgcmVnX2Rldi0+bnJf
em9uZXMgPSBESVZfUk9VTkRfVVAocmVnX2Rldi0+Y2FwYWNpdHksCj4gICAgICAgICAgbGRyICAg
ICByMCwgW3I2LCAjNTZdICAgQCByZWdfZGV2XzE2Ni0+Y2FwYWNpdHksIHJlZ19kZXZfMTY2LT5j
YXBhY2l0eQo+ICAgICAgICAgIGFkZHMgICAgcjEsIHIzLCByMSAgICAgIEAgdG1wMzE2LCBfMjI3
LCByZWdfZGV2XzE2Ni0+Y2FwYWNpdHkKPiAgICAgICAgICBhZGMgICAgIHIwLCByMiwgcjAgICAg
ICBAIHRtcDMxNSwgXzIyNywgcmVnX2Rldl8xNjYtPmNhcGFjaXR5Cj4gICAgICAgICAgc3VicyAg
ICByMSwgcjEsICMxICAgICAgQCwgdG1wMzE2LAo+IEAgZHJpdmVycy9tZC9kbS16b25lZC10YXJn
ZXQuYzo4MDU6ICAgICAgICAgICAgIHJlZ19kZXYtPnpvbmVfbnJfc2VjdG9ycyA9IHpvbmVkX2Rl
di0+em9uZV9ucl9zZWN0b3JzOwo+ICAgICAgICAgIHN0cmQgICAgcjIsIFtyNiwgIzgwXSAgIEAs
IHJlZ19kZXYsCj4gQCBkcml2ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5jOjgwNjogICAgICAgICAg
ICAgcmVnX2Rldi0+bnJfem9uZXMgPSBESVZfUk9VTkRfVVAocmVnX2Rldi0+Y2FwYWNpdHksCj4g
ICAgICAgICAgc2JjICAgICByMCwgcjAsICMwICAgICAgQCwgdG1wMzE1LAo+ICAgICAgICAgIGJs
ICAgICAgX19hZWFiaV91bGRpdm1vZCAgICAgICAgICAgICAgICBACj4gQCBkcml2ZXJzL21kL2Rt
LXpvbmVkLXRhcmdldC5jOjgwNjogICAgICAgICAgICAgcmVnX2Rldi0+bnJfem9uZXMgPSBESVZf
Uk9VTkRfVVAocmVnX2Rldi0+Y2FwYWNpdHksCj4gICAgICAgICAgc3RyICAgICByMSwgW3I2LCAj
NjRdICAgQCB0bXAzMDYsIHJlZ19kZXZfMTY2LT5ucl96b25lcwo+IAo+IGdpdCBibGFtZSBwb2lu
dHMgYXQgdGhpcyBjb21taXQ6Cj4gCj4gY29tbWl0IDcwOTc4MjA4ZWM5MWQ3OTgwNjZmNGMyOTFi
Yzk4ZmY5MTRiZWEyMjIKPiBBdXRob3I6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgo+
IERhdGU6ICAgTW9uIE1heSAxMSAxMDoyNDozMCAyMDIwICswMjAwCj4gCj4gICAgICBkbSB6b25l
ZDogbWV0YWRhdGEgdmVyc2lvbiAyCj4gCj4gUmV2ZXJ0aW5nIHRoYXQgY29tbWl0IGxldHMgdGhl
IGJ1aWxkIGNvbXBsZXRlLgo+IAo+IApJIHRob3VnaHQgSSd2ZSBzZW5kIGEgcGF0Y2ggdG8gZml4
IHRoYXQgdXA7IERJVl9ST1VORF9VUCgpIG5lZWRzIHRvIGJlIApjaGFuZ2VkIHRvIERJVl9ST1VO
RF9VUF9VTEwoKS4KSSdsbCBiZSBjaGVja2luZyBhbmQgd2lsbCBiZSBzZW5kaW5nIGEgcGF0Y2gg
aWYgbmVjZXNzYXJ5LgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAg
ICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkg
KEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgot
LQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

