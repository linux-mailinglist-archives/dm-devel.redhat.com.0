Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 14781F4107
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 08:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573197098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:openpgp:openpgp:autocrypt:autocrypt;
	bh=rtIOc8ex7zJS5EZwxDDU1hFR9l/somLsUGWYPWec5pg=;
	b=hJ5F/oASgS9bZDxgs+dw0jxEmM2eSROOomaiKfHSThNmSxNmahMYdBN0cVl2nRDzFuSusC
	qtf3tTCFz9LN5HEerM7q/nu/cm5kS9oNLqcp3Svf0P8sgYVbgz97XGXIXnN8LD3oBOjVDZ
	C12wlUJVPP9a1b4Z6BgiNG6aPNF4Ncg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-OIpneVMIMAKpp5r4L6UQsg-1; Fri, 08 Nov 2019 02:11:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD4D107ACC3;
	Fri,  8 Nov 2019 07:11:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69557600C9;
	Fri,  8 Nov 2019 07:11:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F06A1803C33;
	Fri,  8 Nov 2019 07:11:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA87B8W1016872 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 02:11:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 233C25D6A5; Fri,  8 Nov 2019 07:11:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C79A5D6AE;
	Fri,  8 Nov 2019 07:11:03 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2B4759445;
	Fri,  8 Nov 2019 07:11:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 56DE7B33C;
	Fri,  8 Nov 2019 07:10:59 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-2-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=hare@suse.de; prefer-encrypt=mutual; keydata=
	mQINBE6KyREBEACwRN6XKClPtxPiABx5GW+Yr1snfhjzExxkTYaINHsWHlsLg13kiemsS6o7
	qrc+XP8FmhcnCOts9e2jxZxtmpB652lxRB9jZE40mcSLvYLM7S6aH0WXKn8bOqpqOGJiY2bc
	6qz6rJuqkOx3YNuUgiAxjuoYauEl8dg4bzex3KGkGRuxzRlC8APjHlwmsr+ETxOLBfUoRNuE
	b4nUtaseMPkNDwM4L9+n9cxpGbdwX0XwKFhlQMbG3rWA3YqQYWj1erKIPpgpfM64hwsdk9zZ
	QO1krgfULH4poPQFpl2+yVeEMXtsSou915jn/51rBelXeLq+cjuK5+B/JZUXPnNDoxOG3j3V
	VSZxkxLJ8RO1YamqZZbVP6jhDQ/bLcAI3EfjVbxhw9KWrh8MxTcmyJPn3QMMEp3wpVX9nSOQ
	tzG72Up/Py67VQe0x8fqmu7R4MmddSbyqgHrab/Nu+ak6g2RRn3QHXAQ7PQUq55BDtj85hd9
	W2iBiROhkZ/R+Q14cJkWhzaThN1sZ1zsfBNW0Im8OVn/J8bQUaS0a/NhpXJWv6J1ttkX3S0c
	QUratRfX4D1viAwNgoS0Joq7xIQD+CfJTax7pPn9rT////hSqJYUoMXkEz5IcO+hptCH1HF3
	qz77aA5njEBQrDRlslUBkCZ5P+QvZgJDy0C3xRGdg6ZVXEXJOQARAQABtCpIYW5uZXMgUmVp
	bmVja2UgKFN1U0UgTGFicykgPGhhcmVAc3VzZS5kZT6JAkEEEwECACsCGwMFCRLMAwAGCwkI
	BwMCBhUIAgkKCwQWAgMBAh4BAheABQJOisquAhkBAAoJEGz4yi9OyKjPOHoQAJLeLvr6JNHx
	GPcHXaJLHQiinz2QP0/wtsT8+hE26dLzxb7hgxLafj9XlAXOG3FhGd+ySlQ5wSbbjdxNjgsq
	FIjqQ88/Lk1NfnqG5aUTPmhEF+PzkPogEV7Pm5Q17ap22VK623MPaltEba+ly6/pGOODbKBH
	ak3gqa7Gro5YCQzNU0QVtMpWyeGF7xQK76DY/atvAtuVPBJHER+RPIF7iv5J3/GFIfdrM+wS
	BubFVDOibgM7UBnpa7aohZ9RgPkzJpzECsbmbttxYaiv8+EOwark4VjvOne8dRaj50qeyJH6
	HLpBXZDJH5ZcYJPMgunghSqghgfuUsd5fHmjFr3hDb5EoqAfgiRMSDom7wLZ9TGtT6viDldv
	hfWaIOD5UhpNYxfNgH6Y102gtMmN4o2P6g3UbZK1diH13s9DA5vI2mO2krGz2c5BOBmcctE5
	iS+JWiCizOqia5Op+B/tUNye/YIXSC4oMR++Fgt30OEafB8twxydMAE3HmY+foawCpGq06yM
	vAguLzvm7f6wAPesDAO9vxRNC5y7JeN4Kytl561ciTICmBR80Pdgs/Obj2DwM6dvHquQbQrU
	Op4XtD3eGUW4qgD99DrMXqCcSXX/uay9kOG+fQBfK39jkPKZEuEV2QdpE4Pry36SUGfohSNq
	xXW+bMc6P+irTT39VWFUJMcSuQINBE6KyREBEACvEJggkGC42huFAqJcOcLqnjK83t4TVwEn
	JRisbY/VdeZIHTGtcGLqsALDzk+bEAcZapguzfp7cySzvuR6Hyq7hKEjEHAZmI/3IDc9nbdh
	EgdCiFatah0XZ/p4vp7KAelYqbv8YF/ORLylAdLh9rzLR6yHFqVaR4WL4pl4kEWwFhNSHLxe
	55G56/dxBuoj4RrFoX3ynerXfbp4dH2KArPc0NfoamqebuGNfEQmDbtnCGE5zKcR0zvmXsRp
	qU7+caufueZyLwjTU+y5p34U4PlOO2Q7/bdaPEdXfpgvSpWk1o3H36LvkPV/PGGDCLzaNn04
	BdiiiPEHwoIjCXOAcR+4+eqM4TSwVpTn6SNgbHLjAhCwCDyggK+3qEGJph+WNtNU7uFfscSP
	k4jqlxc8P+hn9IqaMWaeX9nBEaiKffR7OKjMdtFFnBRSXiW/kOKuuRdeDjL5gWJjY+IpdafP
	KhjvUFtfSwGdrDUh3SvB5knSixE3qbxbhbNxmqDVzyzMwunFANujyyVizS31DnWC6tKzANkC
	k15CyeFC6sFFu+WpRxvC6fzQTLI5CRGAB6FAxz8Hu5rpNNZHsbYs9Vfr/BJuSUfRI/12eOCL
	IvxRPpmMOlcI4WDW3EDkzqNAXn5Onx/b0rFGFpM4GmSPriEJdBb4M4pSD6fN6Y/Jrng/Bdwk
	SQARAQABiQIlBBgBAgAPBQJOiskRAhsMBQkSzAMAAAoJEGz4yi9OyKjPgEwQAIP/gy/Xqc1q
	OpzfFScswk3CEoZWSqHxn/fZasa4IzkwhTUmukuIvRew+BzwvrTxhHcz9qQ8hX7iDPTZBcUt
	ovWPxz+3XfbGqE+q0JunlIsP4N+K/I10nyoGdoFpMFMfDnAiMUiUatHRf9Wsif/nT6oRiPNJ
	T0EbbeSyIYe+ZOMFfZBVGPqBCbe8YMI+JiZeez8L9JtegxQ6O3EMQ//1eoPJ5mv5lWXLFQfx
	f4rAcKseM8DE6xs1+1AIsSIG6H+EE3tVm+GdCkBaVAZo2VMVapx9k8RMSlW7vlGEQsHtI0FT
	c1XNOCGjaP4ITYUiOpfkh+N0nUZVRTxWnJqVPGZ2Nt7xCk7eoJWTSMWmodFlsKSgfblXVfdM
	9qoNScM3u0b9iYYuw/ijZ7VtYXFuQdh0XMM/V6zFrLnnhNmg0pnK6hO1LUgZlrxHwLZk5X8F
	uD/0MCbPmsYUMHPuJd5dSLUFTlejVXIbKTSAMd0tDSP5Ms8Ds84z5eHreiy1ijatqRFWFJRp
	ZtWlhGRERnDH17PUXDglsOA08HCls0PHx8itYsjYCAyETlxlLApXWdVl9YVwbQpQ+i693t/Y
	PGu8jotn0++P19d3JwXW8t6TVvBIQ1dRZHx1IxGLMn+CkDJMOmHAUMWTAXX2rf5tUjas8/v2
	azzYF4VRJsdl+d0MCaSy8mUh
Message-ID: <bc7bb317-28ec-dea7-a317-9936bda801b2@suse.de>
Date: Fri, 8 Nov 2019 08:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191108015702.233102-2-damien.lemoal@wdc.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Fri, 08 Nov 2019 07:11:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 08 Nov 2019 07:11:02 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'hare@suse.de' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/9] block: Enhance
	blk_revalidate_disk_zones()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: OIpneVMIMAKpp5r4L6UQsg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gMTEvOC8xOSAyOjU2IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBGb3IgWkJDIGFuZCBa
QUMgem9uZWQgZGV2aWNlcywgdGhlIHNjc2kgZHJpdmVyIHJldmFsaWRhdGlvbiBwcm9jZXNzaW5n
Cj4gaW1wbGVtZW50ZWQgYnkgc2RfcmV2YWxpZGF0ZV9kaXNrKCkgaW5jbHVkZXMgYSBjYWxsIHRv
Cj4gc2RfemJjX3JlYWRfem9uZXMoKSB3aGljaCBleGVjdXRlcyBhIGZ1bGwgZGlzayB6b25lIHJl
cG9ydCB1c2VkIHRvCj4gY2hlY2sgdGhhdCBhbGwgem9uZXMgb2YgdGhlIGRpc2sgYXJlIHRoZSBz
YW1lIHNpemUuIFRoaXMgcHJvY2Vzc2luZyBpcwo+IGZvbGxvd2VkIGJ5IGEgY2FsbCB0byBibGtf
cmV2YWxpZGF0ZV9kaXNrX3pvbmVzKCksIHVzZWQgdG8gaW5pdGlhbGl6ZQo+IHRoZSBkZXZpY2Ug
cmVxdWVzdCBxdWV1ZSB6b25lIGJpdG1hcHMgKHpvbmUgdHlwZSBhbmQgem9uZSB3cml0ZSBsb2Nr
Cj4gYml0bWFwcykuIFRvIGRvIHNvLCBibGtfcmV2YWxpZGF0ZV9kaXNrX3pvbmVzKCkgYWxzbyBl
eGVjdXRlcyBhIGZ1bGwKPiBkZXZpY2Ugem9uZSByZXBvcnQgdG8gb2J0YWluIHpvbmUgdHlwZXMu
IEFzIGEgcmVzdWx0LCB0aGUgZW50aXJlCj4gem9uZWQgYmxvY2sgZGV2aWNlIHJldmFsaWRhdGlv
biBwcm9jZXNzIGluY2x1ZGVzIHR3byBmdWxsIGRldmljZSB6b25lCj4gcmVwb3J0Lgo+IAo+IEJ5
IG1vdmluZyB0aGUgem9uZSBzaXplIGNoZWNrcyBpbnRvIGJsa19yZXZhbGlkYXRlX2Rpc2tfem9u
ZXMoKSwgdGhpcwo+IHByb2Nlc3MgY2FuIGJlIG9wdGltaXplZCB0byBhIHNpbmdsZSBmdWxsIGRl
dmljZSB6b25lIHJlcG9ydCwgbGVhZGluZyB0bwo+IHNob3J0ZXIgZGV2aWNlIHNjYW4gYW5kIHJl
dmFsaWRhdGlvbiB0aW1lcy4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHRoaXMKPiBvcHRpbWl6YXRp
b24sIHJlZHVjaW5nIHRoZSBvcmlnaW5hbCBmdWxsIGRldmljZSB6b25lIHJlcG9ydCBpbXBsZW1l
bnRlZAo+IGluIHNkX3piY19jaGVja196b25lcygpIHRvIGEgc2luZ2xlLCBzbWFsbCwgcmVwb3J0
IHpvbmVzIGNvbW1hbmQKPiBleGVjdXRpb24gdG8gb2J0YWluIHRoZSBzaXplIG9mIHRoZSBmaXJz
dCB6b25lIG9mIHRoZSBkZXZpY2UuIENoZWNrcwo+IHdoZXRoZXIgYWxsIHpvbmVzIG9mIHRoZSBk
ZXZpY2UgYXJlIHRoZSBzYW1lIHNpemUgYXMgdGhlIGZpcnN0IHpvbmUKPiBzaXplIGFyZSBtb3Zl
ZCB0byB0aGUgZ2VuZXJpYyBibGtfY2hlY2tfem9uZSgpIGZ1bmN0aW9uIGNhbGxlZCBmcm9tCj4g
YmxrX3JldmFsaWRhdGVfZGlza196b25lcygpLgo+IAo+IFRoaXMgb3B0aW1pemF0aW9uIGFsc28g
aGFzIHRoZSBmb2xsb3dpbmcgYmVuZWZpdHM6Cj4gMSkgZmV3ZXIgbWVtb3J5IGFsbG9jYXRpb25z
IGluIHRoZSBzY3NpIGxheWVyIGR1cmluZyBkaXNrIHJldmFsaWRhdGlvbgo+ICAgIGFzIHRoZSBw
b3RlbnRhaWxseSBsYXJnZSBidWZmZXIgZm9yIHpvbmUgcmVwb3J0IGV4ZWN1dGlvbiBpcyBub3QK
PiAgICBuZWVkZWQuCj4gMikgSW1wbGVtZW50IHpvbmUgY2hlY2tzIGluIGEgZ2VuZXJpYyBtYW5u
ZXIsIHJlZHVjaW5nIHRoZSBidXJkZW4gb24KPiAgICBkZXZpY2UgZHJpdmVyIHdoaWNoIG9ubHkg
bmVlZCB0byBvYnRhaW4gdGhlIHpvbmUgc2l6ZSBhbmQgY2hlY2sgdGhhdAo+ICAgIHRoaXMgc2l6
ZSBpcyBhIHBvd2VyIG9mIDIgbnVtYmVyIG9mIExCQXMuIEFueSBuZXcgdHlwZSBvZiB6b25lZAo+
ICAgIGJsb2NrIGRldmljZSB3aWxsIGJlbmVmaXQgZnJvbSB0aGlzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4gLS0tCj4gIGJsb2Nr
L2Jsay16b25lZC5jICAgICB8ICA2MiArKysrKysrKysrKysrKysrKysrKysrKy0KPiAgZHJpdmVy
cy9zY3NpL3NkX3piYy5jIHwgMTA3ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDg5IGRlbGV0aW9u
cygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVl
cnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UJCSAgICAgIFRlYW1sZWFkIFN0b3Jh
Z2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZQkJCSAgICAgICAgICAgICAgICAgICs0OSA5MTEg
NzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSCwgTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAyNDcxNjUgKEFHIE3DvG5jaGVuKSwgR0Y6IEZlbGl4
IEltZW5kw7ZyZmZlcgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

