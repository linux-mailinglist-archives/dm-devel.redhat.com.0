Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9651BF4150
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 08:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573197838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:openpgp:openpgp:autocrypt:autocrypt;
	bh=cK8BNpKtrxCme4yVZfQOFr/p2EmGGqram6W0ohdSSAM=;
	b=Xz/SLgeQB+QxZMpfjMxfbaKyi2JW2dlDiNHqiFma3GC3rml1U37BiifJXRs3iQbFzzZrw9
	uJ9mKrpI4NU2tmcNsBcAoeIT3P+JJuIwoeCkqcyLEsmqo6+2veQcxDc0fxl1D0QWxUeIva
	ZtvDLjm7JR5hD1o17zml7SuXSZr1c2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-X_zZRUzTPYS_ZFM56zwIUg-1; Fri, 08 Nov 2019 02:23:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15ACF1005500;
	Fri,  8 Nov 2019 07:23:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80ECA5C290;
	Fri,  8 Nov 2019 07:23:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0344A4BB65;
	Fri,  8 Nov 2019 07:23:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA87NTCF017438 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 02:23:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 292FF600F0; Fri,  8 Nov 2019 07:23:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEEE5600CA;
	Fri,  8 Nov 2019 07:23:24 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 530F018DA8A8;
	Fri,  8 Nov 2019 07:23:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id ED268B3C7;
	Fri,  8 Nov 2019 07:23:21 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-10-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=hare@suse.de; prefer-encrypt=mutual; keydata=
	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
	azzYF4VRJsdl+d0MCaSy8mUh
Message-ID: <7db8cbf0-7be9-40c8-86b7-85e8803f5218@suse.de>
Date: Fri, 8 Nov 2019 08:23:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191108015702.233102-10-damien.lemoal@wdc.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.63]); Fri, 08 Nov 2019 07:23:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Fri, 08 Nov 2019 07:23:23 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'hare@suse.de' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <hare@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 9/9] block: rework zone reporting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: X_zZRUzTPYS_ZFM56zwIUg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gMTEvOC8xOSAyOjU3IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBGcm9tOiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAKPiBBdm9pZCB0aGUgbmVlZCB0byBhbGxvY2F0ZSBh
IHBvdGVudGlhbGx5IGxhcmdlIGFycmF5IG9mIHN0cnVjdCBibGtfem9uZQo+IGluIHRoZSBibG9j
ayBsYXllciBieSBzd2l0Y2hpbmcgdGhlIC0+cmVwb3J0X3pvbmVzIG1ldGhvZCBpbnRlcmZhY2Ug
dG8KPiBhIGNhbGxiYWNrIG1vZGVsLiBOb3cgdGhlIGNhbGxlciBzaW1wbHkgc3VwcGxpZXMgYSBj
YWxsYmFjayB0aGF0IGlzCj4gZXhlY3V0ZWQgb24gZWFjaCByZXBvcnRlZCB6b25lLCBhbmQgcHJp
dmF0ZSBkYXRhIGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBTaGluJ2ljaGlybyBLYXdhc2FraSA8c2hpbmlj
aGlyby5rYXdhc2FraUB3ZGMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxk
YW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4gLS0tCj4gIGJsb2NrL2Jsay16b25lZC5jICAgICAgICAg
ICAgICB8IDI1MyArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9i
bG9jay9udWxsX2Jsay5oICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvYmxvY2svbnVsbF9ibGtf
em9uZWQuYyB8ICAzMSArKy0tCj4gIGRyaXZlcnMvbWQvZG0tZmxha2V5LmMgICAgICAgICB8ICAx
OCArLS0KPiAgZHJpdmVycy9tZC9kbS1saW5lYXIuYyAgICAgICAgIHwgIDIwICstLQo+ICBkcml2
ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMgfCAxMzEgKysrKysrKy0tLS0tLS0tLS0KPiAgZHJp
dmVycy9tZC9kbS5jICAgICAgICAgICAgICAgIHwgMTIxICsrKysrKystLS0tLS0tLS0KPiAgZHJp
dmVycy9zY3NpL3NkLmggICAgICAgICAgICAgIHwgICA0ICstCj4gIGRyaXZlcnMvc2NzaS9zZF96
YmMuYyAgICAgICAgICB8IDEwNiArKysrKysrLS0tLS0tLQo+ICBmcy9mMmZzL3N1cGVyLmMgICAg
ICAgICAgICAgICAgfCAgNTEgKysrLS0tLQo+ICBpbmNsdWRlL2xpbnV4L2Jsa2Rldi5oICAgICAg
ICAgfCAgMTUgKy0KPiAgaW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVyLmggIHwgIDI0ICsrKy0K
PiAgMTIgZmlsZXMgY2hhbmdlZCwgMzI5IGluc2VydGlvbnMoKyksIDQ0NyBkZWxldGlvbnMoLSkK
PiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoK
SGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlCQkgICAgICBUZWFtbGVhZCBTdG9yYWdlICYg
TmV0d29ya2luZwpoYXJlQHN1c2UuZGUJCQkgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUz
IDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgsIE1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZwpIUkIgMjQ3MTY1IChBRyBNw7xuY2hlbiksIEdGOiBGZWxpeCBJbWVu
ZMO2cmZmZXIKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

