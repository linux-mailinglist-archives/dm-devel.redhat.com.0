Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 8105E19222F
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585124003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VxduLvFQhCvURlPsspcH8+6FdoB1IiEvJGyLfI0m1dU=;
	b=dGsOIbCTfK48Ez1uVSb2CGR2sVKdrYVjr3c8te+hIYRw1oinNJJxImJM3/4L1smFoEqRsC
	dfMTrSgwzqRqWkQlD/37ku02cWEoDAhzoTOAiUMBpVk0QaT73na18qvSmA6cD+b28Vj9LT
	LfYNFju2H9RmaVxBnrA4rL5UbPcHwjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-AuwRMEbDObGbTdY0s_NVxg-1; Wed, 25 Mar 2020 04:13:20 -0400
X-MC-Unique: AuwRMEbDObGbTdY0s_NVxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 320CC801E6C;
	Wed, 25 Mar 2020 08:13:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDF3560C05;
	Wed, 25 Mar 2020 08:13:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EF7B86386;
	Wed, 25 Mar 2020 08:13:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ODCjAW021385 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 09:12:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCEC32026D67; Tue, 24 Mar 2020 13:12:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D86F42022EA5
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 13:12:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 970F0185A793
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 13:12:43 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-469-ZPa8lbEqO7WBgXevrbWvhg-1; Tue, 24 Mar 2020 09:12:41 -0400
X-MC-Unique: ZPa8lbEqO7WBgXevrbWvhg-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02OD98e3100769; Tue, 24 Mar 2020 13:12:40 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 2ywavm45y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 13:12:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02ODCCl8031198; Tue, 24 Mar 2020 13:12:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2yyd9w3yyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 13:12:39 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02ODCc3v015764;
	Tue, 24 Mar 2020 13:12:38 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 24 Mar 2020 06:12:38 -0700
To: Hannes Reinecke <hare@suse.de>, dm-devel@redhat.com
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<e2bef18e-f363-47c4-dd38-971a60ec1eca@suse.de>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <f1cc2096-21f6-59e7-174f-e5e51c492b6b@oracle.com>
Date: Tue, 24 Mar 2020 21:12:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <e2bef18e-f363-47c4-dd38-971a60ec1eca@suse.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	phishscore=0 suspectscore=0
	mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0
	priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
	phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
	lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240070
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2120.oracle.com id
	02OD98e3100769
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ODCjAW021385
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: linux-block@vger.kernel.org, Dmitry.Fomichev@wdc.com, Damien.LeMoal@wdc.com
Subject: Re: [dm-devel] [RFC PATCH v2 0/3] dm zoned: extend the way of
 exposing zoned block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMy8yNC8yMCA3OjUyIFBNLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4gT24gMy8yNC8yMCAx
MjowMiBQTSwgQm9iIExpdSB3cm90ZToKPj4gTW90aXZhdGlvbjoKPj4gZG0tem9uZWQgZXhwb3Nl
cyBhIHpvbmVkIGJsb2NrIGRldmljZShaQkMpIGFzIGEgcmVndWxhciBibG9jayBkZXZpY2UgYnkg
c3RvcmluZwo+PiBtZXRhZGF0YSBhbmQgYnVmZmVyaW5nIHJhbmRvbSB3cml0ZXMgaW4gaXRzIGNv
bnZlbnRpb25hbCB6b25lcy4KPj4gVGhpcyB3YXkgaXMgbm90IGZsZXhpYmxlLCB0aGVyZSBtdXN0
IGJlIGVub3VnaCBjb252ZW50aW9uYWwgem9uZXMgYW5kIHRoZQo+PiBwZXJmb3JtYW5jZSBtYXkg
YmUgY29uc3RyYWluZWQuCj4+Cj4+IFRoaXMgcGF0Y2hzZXQgc3BsaXQgdGhlIG1ldGFkYXRhIGZy
b20gem9uZWQgZGV2aWNlIHRvIGFuIGV4dHJhIHJlZ3VsYXIgZGV2aWNlLAo+PiB3aXRoIGFpbSB0
byBpbmNyZWFzZSB0aGUgZmxleGliaWxpdHkgYW5kIHBvdGVudGlhbCBwZXJmb3JtYW5jZS4KPj4g
Rm9yIGV4YW1wbGUsIG5vdyB3ZSBjYW4gc3RvcmUgbWV0YWRhdGEgaW4gYSBmYXN0ZXIgZGV2aWNl
IGxpa2UgcGVyc2lzdGVudCBtZW1vcnkuCj4+IEFsc28gcmFuZG9tIHdyaXRlcyBjYW4gZ28gdG8g
dGhlIHJlZ3VsYXIgZGV2aWNlcyBpbiB0aGlzIHZlcnNpb24uCj4+Cj4+IFVzYWdlKHdpbGwgc2Vu
ZCB1c2VyIHNwYWNlIHBhdGNoZXMgbGF0ZXIpOgo+Pj4gZG16YWRtIC0tZm9ybWF0ICR6b25lZF9k
ZXYgLS1yZWd1bGFyPSRyZWd1X2RldiAtLWZvcmNlCj4+PiBlY2hvICIwICRzaXplIHpvbmVkICRy
ZWd1X2RldiAkem9uZWRfZGV2IiB8IGRtc2V0dXAgY3JlYXRlICRkbS16b25lZC1uYW1lCj4+Cj4+
IHYyOgo+PiDCoCAqIGVtdWxhdGUgcmVndWxhciBkZXZpY2Ugem9uZSBpbmZvCj4+IMKgICogc3Vw
cG9ydCB3cml0ZSBib3RoIG1ldGFkYXRhIGFuZCByYW5kb20gd3JpdGVzIHRvIHJlZ3VsYXIgZGV2
Cj4+Cj4+IEJvYiBMaXUgKDMpOgo+PiDCoMKgIGRtIHpvbmVkOiByZW5hbWUgZGV2IG5hbWUgdG8g
em9uZWRfZGV2Cj4+IMKgwqAgZG0gem9uZWQ6IGludHJvZHVjZSByZWd1bGFyIGRldmljZSB0byBk
bS16b25lZC10YXJnZXQKPj4gwqDCoCBkbSB6b25lZDogYWRkIHJlZ3VsYXIgZGV2aWNlIGluZm8g
dG8gbWV0YWRhdGEKPj4KPj4gwqAgZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jIHwgMjA1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4+IMKgIGRyaXZlcnMv
bWQvZG0tem9uZWQtdGFyZ2V0LmPCoMKgIHwgMjA1ICsrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tCj4+IMKgIGRyaXZlcnMvbWQvZG0tem9uZWQuaMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNTMgKysrKysrKysrKy0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAyOTkgaW5zZXJ0
aW9ucygrKSwgMTY0IGRlbGV0aW9ucygtKQo+Pgo+IFdlbGwsIHN1cnByaXNlLCBzdXJwcmlzZSwg
Ym90aCBvdXIgcGF0Y2hzZXRzIGFyZSBsYXJnZWx5IGlkZW50aWNhbCAuLi4KPiAKCllvdSBtYXkg
bWlzc2VkIG15IGZpcnN0IHJmYy4KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9hcmNoaXZlcy9kbS1k
ZXZlbC8yMDIwLUphbnVhcnkvbXNnMDAwMjQuaHRtbAoKPiBTbyBob3cgdG8gcHJvY2VlZD8gSSBn
dWVzcyBpZiB5b3Ugd2VyZSB1c2luZyAnY2RldicgaW5zdGVhZCBvZiAncmVndV9kbV9kZXYnIHdl
IHNob3VsZCBiZSBoYXZpbmcgYW4gb3ZlcmxhcCBvZiBhYm91dCA5MCBwZXJjZW50Lgo+IAo+IFRo
ZSBtYWluIGRpZmZlcmVuY2UgYmV0d2VlbiBvdXIgaW1wbGVtZW50YXRpb24gaXMgdGhhdCBJIGRp
ZG4ndCBtb3ZlIHRoZSBtZXRhZGF0YSB0byB0aGUgY2FjaGUvcmVndWxhcmQgZGV2aWNlLCBzZWVp
bmcgdGhhdCBkbXphZG0gd2lsbCBvbmx5IHdyaXRlIG1ldGFkYXRhIG9udG8gdGhlIHpvbmVkIGRl
dmljZS4KCkkgYWxzbyBwYXRjaGVkIGRtemFkbSh3aWxsIHNlbnQgb3V0IHNvb24pIGEgbG90LCBu
b3cgbXkgaW1wbGVtZW50YXRpb24gY2FuIGNvbXBhdGlibGUgd2l0aCBvcmlnaW5hbCB1c2FnZS4K
Ckl0IHN1cHBvcnRzIHR3byBkaWZmZXJlbnQgdXNhZ2U6Ci0gT3JpZ2luYWwgem9uZWQgZGV2aWNl
IG9ubHk6CiM6IGRtemFkbSAtLWZvcm1hdCAkem9uZWRfZGV2CiM6IGVjaG8gIjAgJHNpemUgem9u
ZWQgJHpvbmVkX2RldiIgfCBkbXNldHVwIGNyZWF0ZSAkZG0tem9uZWQtbmFtZQooQWxsIGRhdGEg
aW4gem9uZWQgZGV2aWNlKQoKLSBXaXRoIHJlZ3VsYXIgZGV2aWNl77yaCmRtemFkbSAtLWZvcm1h
dCAkem9uZWRfZGV2IC0tcmVndWxhcj0kcmVndV9kZXYKZWNobyAiMCAkc2l6ZSB6b25lZCAkcmVn
dV9kZXYgJHpvbmVkX2RldiIgfCBkbXNldHVwIGNyZWF0ZSAkZG0tem9uZWQtbmFtZQooTWV0YWRh
dGEgaW4gcmVndWxhciBkZXZpY2UsIG90aGVyIGRhdGEgc3ByZWFkIGluIGJvdGggcmVndWxhciBk
ZXZpY2UgYW5kIHpvbmVkIGRldmljZS4pCgpJIGhhdmVuJ3QgdGhvdWdodCBhYm91dCBzdG9yZSBt
ZXRhZGF0YSBpbiB6b25lZCBkZXYgd2hpbGUgb3RoZXIgZGF0YSBpbiBib3RoIGNhY2hlL3JlZ3Vs
YXIgZGV2aWNlIGFuZCB6b25lZCBkZXYuCkFjdHVhbGx5IGluIG15IGZpcnN0IHJmYyBJIGp1c3Qg
cGxhbiB0byBzcGxpdCBtZXRhZGF0YSB0byBhIGZhc3QgZGV2aWNlLCBzbyBhcyB0byBnZXQgcGVy
Zm9ybWFuY2UgaW1wcm92ZW1lbnQuCgo+IEkgd291bGQgcmF0aGVyIGtlZXAgaXQgdGhhdCB3YXkg
KGllIHN0b3JpbmcgbWV0YWRhdGEgb24gdGhlIHpvbmVkIGRldmljZSwgdG9vLCBpZiBwb3NzaWJs
ZSkgYXMgd2Ugd291bGQgYmUga2VlcGluZyBiYWNrd2FyZHMgY29tcGFiaWxpdHkgd2l0aCB0aGF0
Lgo+IEFuZCB3ZSBjb3VsZCBhbHdheXMgbW92ZSBtZXRhZGF0YSB0byB0aGUgY2FjaGUvcmVndWxh
ciBkZXZpY2UgaW4gYSBsYXRlciBwYXRjaDsgZm9yIGRvaW5nIGl0IHByb3Blcmx5IHdlJ2xsIG5l
ZWQgdG8gdXBkYXRlIHRoZSBtZXRhZGF0YSBhbnl3YXkgYXMgd2UgbmVlZCB0byBpbnRyb2R1Y2Ug
VVVJRHMgdG8gc3RpdGNoIHRob3NlIGRldmljZXMgdG9nZXRoZXIuCgpTdXJlLgoKPiBSZW1lbWJl
ciwgb25lIG15IGhhdmUgbW9yZSB0aGFuIG9uZSB6b25lZCBkZXZpY2UgYW5kIHJlZ3VsYXIgZGV2
aWNlLi4uCj4gCj4gU2hvdWxkIEkgdHJ5IHRvIG1lcmdlIGJvdGggcGF0Y2hzZXRzIGFuZCBzZW5k
IHRoZW0gb3V0IGFzIGFuIFJGQz8KPiAKCkZpbmUgdG8gbWUsIGp1c3QgcGxlYXNlIGtlZXAgbXkg
c2lnbmVkLW9mZi1ieS4KClRoYW5rcywKQm9iCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRt
LWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RtLWRldmVs

